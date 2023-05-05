import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanUser =
    StateNotifierProvider<PeamanUserProvider, PeamanUserProviderState>((ref) {
  return PeamanUserProvider(ref);
});

final providerOfPeamanUsersBySearchKeys =
    FutureProvider.family<PeamanEither<List<PeamanUser>, PeamanError>, String>(
  (ref, searchKey) {
    return ref
        .watch(providerOfPeamanUserRepository)
        .getUsersBySearchKey(searchKey: searchKey);
  },
);

final providerOfPeamanBlockedUsersStream =
    StreamProvider<List<PeamanSubUser>>((ref) {
  final authUser = ref.watch(providerOfPeamanAuthUser);
  if (authUser.isNull) return Stream.value([]);
  return ref
      .watch(providerOfPeamanUserRepository)
      .getBlockedUsersStream(uid: authUser!.uid);
});

final providerOfPeamanBlockedByUsersStream =
    StreamProvider<List<PeamanSubUser>>((ref) {
  final authUser = ref.watch(providerOfPeamanAuthUser);
  if (authUser.isNull) return Stream.value([]);
  return ref
      .watch(providerOfPeamanUserRepository)
      .getBlockedByUsersStream(uid: authUser!.uid);
});

final providerOfPeamanFollowersStream =
    StreamProvider<List<PeamanSubUser>>((ref) {
  final authUser = ref.watch(providerOfPeamanAuthUser);
  if (authUser.isNull) return Stream.value([]);
  return ref
      .watch(providerOfPeamanUserRepository)
      .getFollowersStream(uid: authUser!.uid);
});

final providerOfPeamanFollowingsStream =
    StreamProvider<List<PeamanSubUser>>((ref) {
  final authUser = ref.watch(providerOfPeamanAuthUser);
  if (authUser.isNull) return Stream.value([]);
  return ref
      .watch(providerOfPeamanUserRepository)
      .getFollowingsStream(uid: authUser!.uid);
});

final providerOfPeamanSentFollowRequests =
    StreamProvider<List<PeamanFollowRequest>>((ref) {
  final authUser = ref.watch(providerOfPeamanAuthUser);
  if (authUser.isNull) return Stream.value([]);
  return ref
      .watch(providerOfPeamanUserRepository)
      .getSentFollowRequestsStream(uid: authUser!.uid);
});

final providerOfPeamanReceivedFollowRequests =
    StreamProvider<List<PeamanFollowRequest>>((ref) {
  final authUser = ref.watch(providerOfPeamanAuthUser);
  if (authUser.isNull) return Stream.value([]);
  return ref
      .watch(providerOfPeamanUserRepository)
      .getReceivedFollowRequestsStream(uid: authUser!.uid);
});

final providerOfPeamanSuggestedUsersFuture =
    FutureProvider<PeamanEither<List<PeamanUser>, PeamanError>>((ref) async {
  final authUser = ref.watch(providerOfPeamanAuthUser);
  if (authUser.isNull) return const Success(<PeamanUser>[]);

  final chatsStream = ref.watch(providerOfPeamanUserChatsStream);
  final followersStream = ref.watch(providerOfPeamanFollowersStream);
  final followingsStream = ref.watch(providerOfPeamanFollowingsStream);

  final userIdsFromChats = chatsStream.maybeWhen(
    data: (data) {
      final values = data.reduce(
        (value, element) => element.copyWith(
          userIds: [...element.activeUserIds, ...value.activeUserIds],
        ),
      );
      return values.activeUserIds;
    },
    orElse: () => <String>[],
  );
  final userIdsFromFollowers = followersStream.maybeWhen(
    data: (data) => data.map((e) => e.uid!).toList(),
    orElse: () => <String>[],
  );
  final userIdsFromFollowings = followingsStream.maybeWhen(
    data: (data) => data.map((e) => e.uid!).toList(),
    orElse: () => <String>[],
  );

  final allUserIds = [
    ...userIdsFromChats,
    ...userIdsFromFollowers,
    ...userIdsFromFollowings,
  ];
  final listWrapper = PeamanListWrapper<String>(
    values: allUserIds,
  );

  return await ref
      .watch(providerOfPeamanUsersByIdFuture(listWrapper))
      .maybeWhen(
        data: (data) => data,
        orElse: () => const Success(<PeamanUser>[]),
      );
});

final providerOfPeamanUserRelationshipStatus =
    Provider.family<PeamanUserRelationshipStatus, String>((ref, userId) {
  final followerUserIds = ref
          .watch(providerOfPeamanFollowersStream)
          .asData
          ?.value
          .where((element) => element.uid != null)
          .map((e) => e.uid!)
          .toList() ??
      <String>[];
  final followingUserIds = ref
          .watch(providerOfPeamanFollowingsStream)
          .asData
          ?.value
          .where((element) => element.uid != null)
          .map((e) => e.uid!)
          .toList() ??
      <String>[];
  final sentFollowRequestsUserIds = ref
          .watch(providerOfPeamanSentFollowRequests)
          .asData
          ?.value
          .where((element) => !element.isAccepted)
          .where((element) => element.uid != null)
          .map((e) => e.uid!)
          .toList() ??
      <String>[];
  final receivedFollowRequestsUserIds = ref
          .watch(providerOfPeamanReceivedFollowRequests)
          .asData
          ?.value
          .where((element) => !element.isAccepted)
          .where((element) => element.uid != null)
          .map((e) => e.uid!)
          .toList() ??
      <String>[];
  final acceptedFollowRequestsUserIds = ref
          .watch(providerOfPeamanReceivedFollowRequests)
          .asData
          ?.value
          .where((element) => element.isAccepted)
          .where((element) => element.uid != null)
          .map((e) => e.uid!)
          .toList() ??
      <String>[];

  if (sentFollowRequestsUserIds.contains(userId)) {
    return PeamanUserRelationshipStatus.cancelFollowRequest;
  } else if (receivedFollowRequestsUserIds.contains(userId)) {
    return PeamanUserRelationshipStatus.acceptFollowRequest;
  } else if (followingUserIds.contains(userId)) {
    return PeamanUserRelationshipStatus.unfollow;
  } else if (followerUserIds.contains(userId) &&
      !followingUserIds.contains(userId) &&
      acceptedFollowRequestsUserIds.contains(userId)) {
    return PeamanUserRelationshipStatus.followBack;
  } else {
    return PeamanUserRelationshipStatus.follow;
  }
});

class PeamanUserProvider extends StateNotifier<PeamanUserProviderState> {
  PeamanUserProvider(final Ref ref)
      : _ref = ref,
        super(const PeamanUserProviderState());

  final Ref _ref;
  PeamanUserRepository get _userRepository =>
      _ref.watch(providerOfPeamanUserRepository);
  PeamanUser get _appUser => _ref.read(providerOfLoggedInUser);
  PeamanInfoProvider get _logProvider =>
      _ref.read(providerOfPeamanInfo.notifier);
  PeamanFeedProvider get _feedProvider =>
      _ref.read(providerOfPeamanFeed.notifier);

  Future<void> blockUser({
    required final String friendId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      blockUserState: const BlockUserState.loading(),
    );

    _ref.read(providerOfPeamanBlockedUsersStream).maybeWhen(
          data: (data) async {
            final blockedUids = data.map((e) => e.uid).toList();
            if (blockedUids.contains(friendId)) {
              const error = PeamanError(
                message: 'The user is already blocked.',
              );
              _logProvider.logError(error.message);
              state = state.copyWith(
                blockUserState: const BlockUserState.error(error),
              );
              return;
            }

            final result = await _userRepository.blockUser(
              uid: _appUser.uid!,
              friendId: friendId,
            );
            result.when(
              (success) {
                if (successLogMessage != null) {
                  _logProvider.logSuccess(successLogMessage);
                }
                state = state.copyWith(
                  blockUserState: BlockUserState.success(success),
                );

                _feedProvider.removeFromFeedsByOwnerId(friendId);
              },
              (failure) {
                _logProvider.logError(failure.message);
                state = state.copyWith(
                  blockUserState: BlockUserState.error(failure),
                );
              },
            );
          },
          error: (e, _) {
            _logProvider.logError(e.toString());
            state = state.copyWith(
              blockUserState: BlockUserState.error(
                PeamanError(message: e.toString()),
              ),
            );
          },
          orElse: () {},
        );
  }

  Future<void> unblockUser({
    required final String userId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      unblockUserState: const UnblockUserState.loading(),
    );

    _ref.read(providerOfPeamanBlockedUsersStream).maybeWhen(
          data: (data) async {
            final blockedUids = data.map((e) => e.uid).toList();
            if (!blockedUids.contains(userId)) {
              const error = PeamanError(
                message: 'The user is not already blocked.',
              );
              _logProvider.logError(error.message);
              state = state.copyWith(
                blockUserState: const BlockUserState.error(error),
              );
              return;
            }

            final result = await _userRepository.unblockUser(
              uid: _appUser.uid!,
              friendId: userId,
            );
            state = result.when(
              (success) {
                if (successLogMessage != null) {
                  _logProvider.logSuccess(successLogMessage);
                }
                return state.copyWith(
                  unblockUserState: UnblockUserState.success(success),
                );
              },
              (failure) {
                _logProvider.logError(failure.message);
                return state.copyWith(
                  unblockUserState: UnblockUserState.error(failure),
                );
              },
            );
          },
          error: (e, _) {
            _logProvider.logError(e.toString());
            state = state.copyWith(
              unblockUserState: UnblockUserState.error(
                PeamanError(message: e.toString()),
              ),
            );
          },
          orElse: () {},
        );
  }

  Future<void> followUser({
    required final String userId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      followUserState: const FollowUserState.loading(),
    );

    _ref.read(providerOfPeamanSentFollowRequests).maybeWhen(
          data: (data) async {
            final sentFollowRequestUserIds = data
                .where((element) => !element.isAccepted)
                .map((e) => e.uid)
                .toList();
            if (sentFollowRequestUserIds.contains(userId)) {
              const error = PeamanError(
                message: 'The user is already followed',
              );
              _logProvider.logError(error.message);
              state = state.copyWith(
                followUserState: const FollowUserState.error(error),
              );
              return;
            }

            final result = await _userRepository.followUser(
              uid: _appUser.uid!,
              friendId: userId,
            );
            state = result.when(
              (success) {
                if (successLogMessage != null) {
                  _logProvider.logSuccess(successLogMessage);
                }
                return state.copyWith(
                  followUserState: FollowUserState.success(success),
                );
              },
              (failure) {
                _logProvider.logError(failure.message);
                return state.copyWith(
                  followUserState: FollowUserState.error(failure),
                );
              },
            );
          },
          error: (e, _) {
            _logProvider.logError(e.toString());
            state = state.copyWith(
              followUserState: FollowUserState.error(
                PeamanError(message: e.toString()),
              ),
            );
          },
          orElse: () {},
        );
  }

  Future<void> unfollowUser({
    required final String userId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      unfollowUserState: const UnfollowUserState.loading(),
    );

    _ref.read(providerOfPeamanFollowingsStream).maybeWhen(
          data: (data) async {
            final followingUserIds = data.map((e) => e.uid).toList();
            if (!followingUserIds.contains(userId)) {
              const error = PeamanError(
                message: 'The user is already unfollowed',
              );
              _logProvider.logError(error.message);
              state = state.copyWith(
                unfollowUserState: const UnfollowUserState.error(error),
              );
              return;
            }

            final result = await _userRepository.unfollowUser(
              uid: _appUser.uid!,
              friendId: userId,
            );
            result.when(
              (success) {
                if (successLogMessage != null) {
                  _logProvider.logSuccess(successLogMessage);
                }
                state = state.copyWith(
                  unfollowUserState: UnfollowUserState.success(success),
                );
                _feedProvider.removeFromFeedsByOwnerId(userId);
              },
              (failure) {
                _logProvider.logError(failure.message);
                state = state.copyWith(
                  unfollowUserState: UnfollowUserState.error(failure),
                );
              },
            );
          },
          error: (e, _) {
            _logProvider.logError(e.toString());
            state = state.copyWith(
              unfollowUserState: UnfollowUserState.error(
                PeamanError(message: e.toString()),
              ),
            );
          },
          orElse: () {},
        );
  }

  Future<void> cancelFollowRequest({
    required final String userId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      cancelFollowState: const CancelFollowState.loading(),
    );

    _ref.read(providerOfPeamanSentFollowRequests).maybeWhen(
          data: (data) async {
            final sentFollowRequestUserIds = data
                .where((element) => !element.isAccepted)
                .map((e) => e.uid)
                .toList();
            if (!sentFollowRequestUserIds.contains(userId)) {
              const error = PeamanError(
                message: 'The follow request is already canceled',
              );
              _logProvider.logError(error.message);
              state = state.copyWith(
                cancelFollowState: const CancelFollowState.error(error),
              );
              return;
            }

            final result = await _userRepository.cancelFollowRequest(
              uid: _appUser.uid!,
              friendId: userId,
            );
            state = result.when(
              (success) {
                if (successLogMessage != null) {
                  _logProvider.logSuccess(successLogMessage);
                }
                return state.copyWith(
                  cancelFollowState: CancelFollowState.success(success),
                );
              },
              (failure) {
                _logProvider.logError(failure.message);
                return state.copyWith(
                  cancelFollowState: CancelFollowState.error(failure),
                );
              },
            );
          },
          error: (e, _) {
            _logProvider.logError(e.toString());
            state = state.copyWith(
              cancelFollowState: CancelFollowState.error(
                PeamanError(message: e.toString()),
              ),
            );
          },
          orElse: () {},
        );
  }

  Future<void> acceptFollowRequest({
    required final String userId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      acceptFollowState: const AcceptFollowState.loading(),
    );

    _ref.read(providerOfPeamanFollowersStream).maybeWhen(
          data: (data) async {
            final followerUserIds = data.map((e) => e.uid).toList();
            if (followerUserIds.contains(userId)) {
              const error = PeamanError(
                message: 'The follow request is already accepted',
              );
              _logProvider.logError(error.message);
              state = state.copyWith(
                acceptFollowState: const AcceptFollowState.error(error),
              );
              return;
            }

            final result = await _userRepository.acceptFollowRequest(
              uid: _appUser.uid!,
              friendId: userId,
            );
            result.when(
              (success) {
                if (successLogMessage != null) {
                  _logProvider.logSuccess(successLogMessage);
                }
                state = state.copyWith(
                  acceptFollowState: AcceptFollowState.success(success),
                );
              },
              (failure) {
                _logProvider.logError(failure.message);
                state = state.copyWith(
                  acceptFollowState: AcceptFollowState.error(failure),
                );
              },
            );
          },
          error: (e, _) {
            _logProvider.logError(e.toString());
            state = state.copyWith(
              acceptFollowState: AcceptFollowState.error(
                PeamanError(message: e.toString()),
              ),
            );
          },
          orElse: () {},
        );
  }

  Future<void> followBackUser({
    required final String userId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      followBackState: const FollowBackState.loading(),
    );

    _ref.read(providerOfPeamanReceivedFollowRequests).maybeWhen(
          data: (data) async {
            final receivedFollowRequestUserIds = data
                .where((element) => !element.isAccepted)
                .map((e) => e.uid)
                .toList();
            if (receivedFollowRequestUserIds.contains(userId)) {
              const error = PeamanError(
                message: 'The user is already followed',
              );
              _logProvider.logError(error.message);
              state = state.copyWith(
                followBackState: const FollowBackState.error(error),
              );
              return;
            }

            final result = await _userRepository.followBackUser(
              uid: _appUser.uid!,
              friendId: userId,
            );
            result.when(
              (success) {
                if (successLogMessage != null) {
                  _logProvider.logSuccess(successLogMessage);
                }
                state = state.copyWith(
                  followBackState: FollowBackState.success(success),
                );
                _feedProvider.addProfileFeedsToTimelineFeeds();
              },
              (failure) {
                _logProvider.logError(failure.message);
                state = state.copyWith(
                  followBackState: FollowBackState.error(failure),
                );
              },
            );
          },
          error: (e, _) {
            _logProvider.logError(e.toString());
            state = state.copyWith(
              followBackState: FollowBackState.error(
                PeamanError(message: e.toString()),
              ),
            );
          },
          orElse: () {},
        );
  }

  Future<void> toggleBlockUnblock({
    required final String friendId,
    final String? successLogMessage,
  }) async {
    await _ref.read(providerOfPeamanBlockedUsersStream).maybeWhen(
          data: (data) async {
            final blockedUids = data.map((e) => e.uid).toList();
            if (blockedUids.contains(friendId)) {
              await unblockUser(
                userId: friendId,
                successLogMessage: successLogMessage,
              );
            } else {
              await blockUser(
                friendId: friendId,
                successLogMessage: successLogMessage,
              );
            }
          },
          error: (e, _) {
            _logProvider.logError(e.toString());
          },
          orElse: () {},
        );
  }

  Future<void> performFollowAction({
    required final String userId,
    final String? followSuccessLogMessage,
    final String? unfollowSuccessLogMessage,
    final String? cancelfollowRequestSuccessLogMessage,
    final String? acceptFollowRequestSuccessLogMessage,
    final String? followBackSuccessLogMessage,
  }) async {
    final followerUserIds = _ref
            .read(providerOfPeamanFollowersStream)
            .asData
            ?.value
            .where((element) => element.uid != null)
            .map((e) => e.uid!)
            .toList() ??
        <String>[];
    final followingUserIds = _ref
            .read(providerOfPeamanFollowingsStream)
            .asData
            ?.value
            .where((element) => element.uid != null)
            .map((e) => e.uid!)
            .toList() ??
        <String>[];
    final sentFollowRequestsUserIds = _ref
            .read(providerOfPeamanSentFollowRequests)
            .asData
            ?.value
            .where((element) => !element.isAccepted)
            .where((element) => element.uid != null)
            .map((e) => e.uid!)
            .toList() ??
        <String>[];
    final receivedFollowRequestsUserIds = _ref
            .read(providerOfPeamanReceivedFollowRequests)
            .asData
            ?.value
            .where((element) => !element.isAccepted)
            .where((element) => element.uid != null)
            .map((e) => e.uid!)
            .toList() ??
        <String>[];
    final acceptedFollowRequestsUserIds = _ref
            .read(providerOfPeamanReceivedFollowRequests)
            .asData
            ?.value
            .where((element) => element.isAccepted)
            .where((element) => element.uid != null)
            .map((e) => e.uid!)
            .toList() ??
        <String>[];

    if (sentFollowRequestsUserIds.contains(userId)) {
      return cancelFollowRequest(
        userId: userId,
        successLogMessage: cancelfollowRequestSuccessLogMessage,
      );
    } else if (receivedFollowRequestsUserIds.contains(userId)) {
      return acceptFollowRequest(
        userId: userId,
        successLogMessage: acceptFollowRequestSuccessLogMessage,
      );
    } else if (followingUserIds.contains(userId)) {
      return unfollowUser(
        userId: userId,
        successLogMessage: unfollowSuccessLogMessage,
      );
    } else if (followerUserIds.contains(userId) &&
        !followingUserIds.contains(userId) &&
        acceptedFollowRequestsUserIds.contains(userId)) {
      return followBackUser(
        userId: userId,
        successLogMessage: followBackSuccessLogMessage,
      );
    } else {
      return followUser(
        userId: userId,
        successLogMessage: followSuccessLogMessage,
      );
    }
  }

  Future<PeamanEither<bool, PeamanError>> updateUser({
    final String? uid,
    required final List<PeamanField> fields,
  }) async {
    state = state.copyWith(
      updateUserState: const UpdateUserState.loading(),
    );
    final result = await _userRepository.updateUser(
      uid: uid ?? _appUser.uid!,
      fields: fields,
    );
    state = result.when(
      (success) => state.copyWith(
        updateUserState: UpdateUserState.success(success),
      ),
      (failure) {
        _logProvider.logError(failure.message);
        return state.copyWith(
          updateUserState: UpdateUserState.error(failure),
        );
      },
    );
    return result;
  }
}
