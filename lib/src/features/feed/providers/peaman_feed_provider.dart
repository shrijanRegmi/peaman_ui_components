import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanFeed =
    StateNotifierProvider<PeamanFeedProvider, PeamanFeedProviderState>((ref) {
  return PeamanFeedProvider(ref);
});

final providerOfPeamanTimelineFeedsFuture =
    FutureProvider<PeamanEither<List<PeamanFeed>, PeamanError>>((ref) async {
  // final timelineFeeds = ref.watch(
  //   providerOfPeamanFeed.select((value) => value.timelineFeeds),
  // );
  // if (timelineFeeds.isNotEmpty) {
  //   return Future.value(Success(timelineFeeds));
  // }

  return ref.watch(providerOfPeamanFeedRepository).getFeeds().then(
    (value) {
      value.when(
        (success) =>
            ref.read(providerOfPeamanFeed.notifier).setTimelineFeeds(success),
        (failure) => null,
      );
      return value;
    },
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

class PeamanFeedProvider extends StateNotifier<PeamanFeedProviderState> {
  PeamanFeedProvider(final Ref ref)
      : _ref = ref,
        super(const PeamanFeedProviderState());

  final Ref _ref;

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

  void updateToFeeds(final PeamanFeed feed) {
    final indexTimeline = state.timelineFeeds.indexWhere(
      (element) => element.id == feed.id,
    );
    state = state.copyWith(
      timelineFeeds: state.timelineFeeds..[indexTimeline] = feed,
    );
  }

  void removeFromFeeds(final String feedId) {
    state = state.copyWith(
      timelineFeeds:
          state.timelineFeeds.where((element) => element.id != feedId).toList(),
    );
  }
}
