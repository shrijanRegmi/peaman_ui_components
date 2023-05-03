import 'dart:math';

import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanFeed =
    StateNotifierProvider<PeamanFeedProvider, PeamanFeedProviderState>((ref) {
  return PeamanFeedProvider(ref);
});

final providerOfPeamanTimelineFeedsFuture =
    FutureProvider<PeamanEither<List<PeamanFeed>, PeamanError>>((ref) async {
  final feedRepository = ref.watch(providerOfPeamanFeedRepository);
  return feedRepository.getFeeds().then(
        (value) => value.when(
          (success) async {
            final updatedFeeds = await ref
                .read(providerOfPeamanFeed.notifier)
                .addStatusToFeeds(feeds: success);
            ref
                .read(providerOfPeamanFeed.notifier)
                .setTimelineFeeds(updatedFeeds);

            return Success(updatedFeeds);
          },
          Failure.new,
        ),
      );
});

final providerOfSinglePeamanFeedByIdFuture =
    FutureProvider.family<PeamanEither<PeamanFeed, PeamanError>, String>(
        (ref, feedId) async {
  return ref.watch(providerOfPeamanFeedRepository).getSingleFeed(
        feedId: feedId,
      );
});

final providerOfSinglePeamanFeedFromFeedsFuture =
    Provider.family<AsyncValue<PeamanEither<PeamanFeed, PeamanError>>, String>(
        (ref, feedId) {
  final feedsFuture = ref.watch(providerOfPeamanTimelineFeedsFuture);

  final AsyncValue<PeamanEither<PeamanFeed?, PeamanError>> feedFromFeedsList =
      feedsFuture.when(
    data: (data) {
      return data.when(
        (success) {
          final index = success.indexWhere((element) => element.id == feedId);
          if (index == -1) return const AsyncData(Success(null));
          return AsyncData(Success(success[index]));
        },
        (failure) => AsyncError(failure.message, StackTrace.current),
      );
    },
    loading: AsyncLoading.new,
    error: AsyncError.new,
  );

  return feedFromFeedsList.when(
    data: (data) {
      return data.when(
        (success) {
          if (success != null) return AsyncData(Success(success));
          final singleFeedFuture = ref.watch(
            providerOfPeamanSingleFeedByIdFuture(feedId),
          );
          return singleFeedFuture.when(
            data: (data) {
              return data.when(
                (success) => AsyncData(Success(success)),
                (failure) => AsyncError(failure.message, StackTrace.current),
              );
            },
            loading: () => const AsyncLoading(),
            error: AsyncError.new,
          );
        },
        (failure) => AsyncError(failure.message, StackTrace.current),
      );
    },
    error: AsyncError.new,
    loading: AsyncLoading.new,
  );
});

final providerOfPeamanSingleFeedByIdFuture =
    FutureProvider.family<PeamanEither<PeamanFeed, PeamanError>, String>(
        (ref, feedId) async {
  return ref.watch(providerOfPeamanFeedRepository).getSingleFeed(
        feedId: feedId,
      );
});

final providerOfPeamanSingleReactionByIdFuture = FutureProvider.family<
    PeamanEither<PeamanReaction, PeamanError>,
    PeamanGetSingleReactionByIdArgs>((ref, args) {
  return ref.watch(providerOfPeamanFeedRepository).getSingleReaction(
        feedId: args.feedId,
        reactionId: args.reactionId,
      );
});

class PeamanFeedProvider extends StateNotifier<PeamanFeedProviderState> {
  PeamanFeedProvider(final Ref ref)
      : _ref = ref,
        super(const PeamanFeedProviderState());

  final Ref _ref;

  PeamanUser get _appUser => _ref.read(providerOfLoggedInUser);

  PeamanFeedRepository get _feedRepository =>
      _ref.watch(providerOfPeamanFeedRepository);
  PeamanInfoProvider get _logProvider =>
      _ref.read(providerOfPeamanInfo.notifier);

  Future<void> createFeed({
    required final PeamanFeed feed,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      createFeedState: const CreateFeedState.loading(),
    );
    final result = await _feedRepository.createFeed(
      feed: feed,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          createFeedState: CreateFeedState.success(success),
        );
        addToFeeds(success);
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          createFeedState: CreateFeedState.error(failure),
        );
      },
    );
  }

  Future<void> updateFeed({
    required final String feedId,
    required final List<PeamanField> fields,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      updateFeedState: const UpdateFeedState.loading(),
    );
    final result = await _feedRepository.updateFeed(
      feedId: feedId,
      fields: fields,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          updateFeedState: UpdateFeedState.success(success),
        );
        final feedData = PeamanCommonHelper().prepareDataToUpdate(
          fields: fields,
        );
        updateToFeeds(
          feedId: feedId,
          feedData: feedData,
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          updateFeedState: UpdateFeedState.error(failure),
        );
      },
    );
  }

  Future<void> deleteFeed({
    required final String feedId,
    required final String ownerId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      deleteFeedState: const DeleteFeedState.loading(),
    );
    final result = await _feedRepository.deleteFeed(
      feedId: feedId,
      ownerId: ownerId,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          deleteFeedState: DeleteFeedState.success(success),
        );
        removeFromFeeds(feedId);
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          deleteFeedState: DeleteFeedState.error(failure),
        );
      },
    );
  }

  Future<void> hideFeed({
    required final String feedId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      hideFeedState: const HideFeedState.loading(),
    );
    final result = await _feedRepository.updateFeed(
      feedId: feedId,
      fields: [
        const PeamanField(
          key: 'visibility',
          value: false,
        ),
      ],
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          hideFeedState: HideFeedState.success(success),
        );
        removeFromFeeds(feedId);
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          hideFeedState: HideFeedState.error(failure),
        );
      },
    );
  }

  Future<void> showFeed({
    required final String feedId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      showFeedState: const ShowFeedState.loading(),
    );
    final result = await _feedRepository.updateFeed(
      feedId: feedId,
      fields: [
        const PeamanField(
          key: 'visibility',
          value: true,
        ),
      ],
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          showFeedState: ShowFeedState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          showFeedState: ShowFeedState.error(failure),
        );
      },
    );
  }

  Future<void> saveFeed({
    required final String feedId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      saveFeedState: const SaveFeedState.loading(),
    );
    updateToFeeds(
      feedId: feedId,
      feedData: {
        'isSaved': true,
      },
    );
    final result = await _feedRepository.saveFeed(
      feedId: feedId,
      uid: _appUser.uid!,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          saveFeedState: SaveFeedState.success(success),
        );
        updateToFeeds(
          feedId: feedId,
          feedData: {
            'isSaved': true,
          },
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          saveFeedState: SaveFeedState.error(failure),
        );
        updateToFeeds(
          feedId: feedId,
          feedData: {
            'isSaved': false,
          },
        );
      },
    );
  }

  Future<void> unsaveFeed({
    required final String feedId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      unsaveFeedState: const UnsaveFeedState.loading(),
    );
    updateToFeeds(
      feedId: feedId,
      feedData: {
        'isSaved': false,
      },
    );
    final result = await _feedRepository.unsaveFeed(
      feedId: feedId,
      uid: _appUser.uid!,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          unsaveFeedState: UnsaveFeedState.success(success),
        );
        updateToFeeds(
          feedId: feedId,
          feedData: {
            'isSaved': false,
          },
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          unsaveFeedState: UnsaveFeedState.error(failure),
        );
        updateToFeeds(
          feedId: feedId,
          feedData: {
            'isSaved': true,
          },
        );
      },
    );
  }

  Future<void> createReaction({
    required final PeamanReaction reaction,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      createReactionState: const CreateReactionState.loading(),
    );
    final result = await _feedRepository.createReaction(
      reaction: reaction.copyWith(
        id: '${reaction.ownerId}_${reaction.parentId}',
      ),
      updateParentReactionsCount: true,
      updateUserReactionsCount: true,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          createReactionState: CreateReactionState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          createReactionState: CreateReactionState.error(failure),
        );
      },
    );
  }

  Future<void> createComment({
    required final PeamanComment comment,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      createCommentState: const CreateCommentState.loading(),
    );
    final result = await _feedRepository.createComment(
      comment: comment,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          createCommentState: CreateCommentState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          createCommentState: CreateCommentState.error(failure),
        );
      },
    );
  }

  Future<void> deleteReaction({
    required final String feedId,
    required final String ownerId,
    required final String parentId,
    required final String parentOwnerId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      deleteReactionState: const DeleteReactionState.loading(),
    );
    final result = await _feedRepository.deleteReaction(
      feedId: feedId,
      reactionId: '${ownerId}_$parentId',
      ownerId: ownerId,
      parentId: parentId,
      parentOwnerId: parentOwnerId,
      updateParentReactionsCount: true,
      updateUserReactionsCount: true,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          deleteReactionState: DeleteReactionState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          deleteReactionState: DeleteReactionState.error(failure),
        );
      },
    );
  }

  Future<void> deleteComment({
    required String feedId,
    required String commentId,
    required String ownerId,
    required String parentId,
    required String parentOwnerId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      deleteCommentState: const DeleteCommentState.loading(),
    );
    final result = await _feedRepository.deleteComment(
      feedId: feedId,
      commentId: commentId,
      ownerId: ownerId,
      parentId: parentId,
      parentOwnerId: parentOwnerId,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          deleteCommentState: DeleteCommentState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          deleteCommentState: DeleteCommentState.error(failure),
        );
      },
    );
  }

  Future<void> createFeedReaction({
    required final String feedId,
    required final String feedOwnerId,
    final String? successLogMessage,
  }) async {
    final reaction = PeamanReaction(
      feedId: feedId,
      ownerId: _appUser.uid,
      parent: PeamanReactionParent.feed,
      parentId: feedId,
      parentOwnerId: feedOwnerId,
    );
    updateToFeeds(
      feedId: feedId,
      feedData: {
        'isReacted': true,
      },
    );
    await createReaction(
      reaction: reaction,
      successLogMessage: successLogMessage,
    );
    state.createReactionState.maybeWhen(
      success: (success) => updateToFeeds(
        feedId: feedId,
        feedData: {
          'isReacted': true,
        },
      ),
      error: (e) => updateToFeeds(
        feedId: feedId,
        feedData: {
          'isReacted': false,
        },
      ),
      orElse: () {},
    );
  }

  Future<void> deleteFeedReaction({
    required final String feedId,
    required final String feedOwnerId,
    final String? successLogMessage,
  }) async {
    updateToFeeds(
      feedId: feedId,
      feedData: {
        'isReacted': false,
      },
    );
    await deleteReaction(
      feedId: feedId,
      ownerId: _appUser.uid!,
      parentId: feedId,
      parentOwnerId: feedOwnerId,
      successLogMessage: successLogMessage,
    );
    state.deleteReactionState.maybeWhen(
      success: (success) => updateToFeeds(
        feedId: feedId,
        feedData: {
          'isReacted': false,
        },
      ),
      error: (e) => updateToFeeds(
        feedId: feedId,
        feedData: {
          'isReacted': true,
        },
      ),
      orElse: () {},
    );
  }

  Future<void> createCommentReaction({
    required final String feedId,
    required final String commentId,
    required final String commentOwnerId,
    final String? successLogMessage,
  }) {
    final reaction = PeamanReaction(
      feedId: feedId,
      ownerId: _appUser.uid,
      parent: PeamanReactionParent.comment,
      parentId: commentId,
      parentOwnerId: commentOwnerId,
    );
    return createReaction(
      reaction: reaction,
      successLogMessage: successLogMessage,
    );
  }

  Future<void> deleteCommentReaction({
    required final String feedId,
    required final String commentId,
    required final String commentOwnerId,
    final String? successLogMessage,
  }) {
    return deleteReaction(
      feedId: feedId,
      ownerId: _appUser.uid!,
      parentId: commentId,
      parentOwnerId: commentOwnerId,
      successLogMessage: successLogMessage,
    );
  }

  Future<List<PeamanFeed>> addStatusToFeeds({
    required final List<PeamanFeed> feeds,
  }) async {
    final futures = <Future<PeamanFeed?>>[];

    for (final feed in feeds) {
      var newFeed = feed;

      final reactionFuture = _feedRepository.getSingleReaction(
        feedId: feed.id!,
        reactionId: '${_appUser.uid}_${feed.id}',
      );
      final saveFuture = _feedRepository.getSingleFeedSaver(
        feedId: feed.id!,
        uid: _appUser.uid!,
      );

      final future = Future.wait<dynamic>([
        reactionFuture,
        saveFuture,
      ]).then((value) {
        if (value.first is PeamanEither<PeamanReaction, PeamanError>) {
          final reaction =
              value.first as PeamanEither<PeamanReaction, PeamanError>;
          newFeed = reaction.when(
            (success) => newFeed.copyWith(
              extraData: {
                ...newFeed.extraData,
                'isReacted'.toJsonKey: success.id != null && !success.unreacted,
              },
            ),
            (failure) => newFeed,
          );
        }
        if (value.length >= 2 &&
            value[1] is PeamanEither<PeamanSubUser, PeamanError>) {
          final feedSaver =
              value[1] as PeamanEither<PeamanSubUser, PeamanError>;
          newFeed = feedSaver.when(
            (success) => newFeed.copyWith(
              extraData: {
                ...newFeed.extraData,
                'isSaved'.toJsonKey: success.uid == _appUser.uid,
              },
            ),
            (failure) => newFeed,
          );
        }

        return newFeed;
      });

      futures.add(future);
    }

    final result = await Future.wait(futures);
    final updatedFeeds =
        result.where((element) => element != null).map((e) => e!).toList();
    return updatedFeeds;
  }

  void setTimelineFeeds(final List<PeamanFeed> newVal) {
    state = state.copyWith(
      timelineFeeds: newVal,
    );
  }

  void addToFeeds(
    final PeamanFeed feed, {
    final bool addToLast = false,
  }) {
    state = state.copyWith(
      timelineFeeds: addToLast
          ? [...state.timelineFeeds, feed]
          : [feed, ...state.timelineFeeds],
    );
  }

  void updateToFeeds({
    required final String feedId,
    required final Map<String, dynamic> feedData,
  }) {
    state = state.copyWith(
      timelineFeeds: _getUpdatedFeedsList(
        feeds: state.timelineFeeds,
        feedId: feedId,
        feedData: feedData,
      ),
    );
  }

  List<PeamanFeed> _getUpdatedFeedsList({
    required final List<PeamanFeed> feeds,
    required final String feedId,
    required final Map<String, dynamic> feedData,
  }) {
    final feedDataToJsonKey = feedData.map(
      (key, value) => MapEntry(key.toJsonKey, value),
    );
    final modifiableFeeds = List<PeamanFeed>.from(feeds);

    var index = modifiableFeeds.indexWhere(
      (element) => element.id == feedId,
    );
    if (index != -1) {
      var feed = modifiableFeeds[index];
      var newFeed = feed.copyWith(
        extraData: {
          ...feed.extraData,
          ...feedDataToJsonKey,
        },
      );

      // update reactions countc
      if (feed.isReacted != newFeed.isReacted) {
        if (!feed.isReacted && newFeed.isReacted) {
          newFeed = newFeed.copyWith(
            reactionsCount: newFeed.reactionsCount + 1,
          );
        } else if (feed.isReacted && !newFeed.isReacted) {
          newFeed = newFeed.copyWith(
            reactionsCount: max(newFeed.reactionsCount - 1, 0),
          );
        }
      }

      // update saves count
      if (feed.isSaved != newFeed.isSaved) {
        if (!feed.isSaved && newFeed.isSaved) {
          newFeed = newFeed.copyWith(
            savesCount: newFeed.savesCount + 1,
          );
        } else if (feed.isSaved && !newFeed.isSaved) {
          newFeed = newFeed.copyWith(
            savesCount: max(newFeed.savesCount - 1, 0),
          );
        }
      }

      modifiableFeeds[index] = newFeed;
    }
    return modifiableFeeds;
  }

  void removeFromFeeds(final String feedId) {
    state = state.copyWith(
      timelineFeeds:
          state.timelineFeeds.where((element) => element.id != feedId).toList(),
    );
  }
}
