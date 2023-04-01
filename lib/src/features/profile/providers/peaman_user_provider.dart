import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  final appUser = ref.read(providerOfLoggedInUser);
  return ref.watch(providerOfPeamanUserRepository).getBlockedUsersStream(
        uid: appUser.uid!,
      );
});

final providerOfPeamanBlockedByUsersStream =
    StreamProvider<List<PeamanSubUser>>((ref) {
  final appUser = ref.read(providerOfLoggedInUser);
  return ref.watch(providerOfPeamanUserRepository).getBlockedByUsersStream(
        uid: appUser.uid!,
      );
});

class PeamanUserProvider extends StateNotifier<PeamanUserProviderState> {
  PeamanUserProvider(final Ref ref)
      : _ref = ref,
        super(const PeamanUserProviderState());

  final Ref _ref;
  PeamanUserRepository get _userRepository =>
      _ref.watch(providerOfPeamanUserRepository);
  PeamanUser get _appUser => _ref.watch(providerOfLoggedInUser);

  Future<void> blockUser({
    final String? uid,
    required final String friendId,
  }) async {
    state = state.copyWith(
      blockUserState: const BlockUserState.loading(),
    );

    _ref.read(providerOfPeamanBlockedUsersStream).maybeWhen(
          data: (data) async {
            final blockedUids = data.map((e) => e.uid).toList();
            if (blockedUids.contains(friendId)) {
              state = state.copyWith(
                blockUserState: const BlockUserState.error(
                  PeamanError(
                    message: 'The user is already blocked.',
                  ),
                ),
              );
              return;
            }

            final result = await _userRepository.blockUser(
              uid: uid ?? _appUser.uid!,
              friendId: friendId,
            );
            state = result.when(
              (success) => state.copyWith(
                blockUserState: BlockUserState.success(success),
              ),
              (failure) => state.copyWith(
                blockUserState: BlockUserState.error(failure),
              ),
            );
          },
          error: (e, _) => state = state.copyWith(
            blockUserState: BlockUserState.error(
              PeamanError(message: e.toString()),
            ),
          ),
          orElse: () {},
        );
  }

  Future<void> unblockUser({
    final String? uid,
    required final String friendId,
  }) async {
    state = state.copyWith(
      unblockUserState: const UnblockUserState.loading(),
    );

    _ref.read(providerOfPeamanBlockedUsersStream).maybeWhen(
          data: (data) async {
            final blockedUids = data.map((e) => e.uid).toList();
            if (!blockedUids.contains(friendId)) {
              state = state.copyWith(
                blockUserState: const BlockUserState.error(
                  PeamanError(
                    message: 'The user is not already blocked.',
                  ),
                ),
              );
              return;
            }

            final result = await _userRepository.unblockUser(
              uid: uid ?? _appUser.uid!,
              friendId: friendId,
            );
            state = result.when(
              (success) => state.copyWith(
                unblockUserState: UnblockUserState.success(success),
              ),
              (failure) => state.copyWith(
                unblockUserState: UnblockUserState.error(failure),
              ),
            );
          },
          error: (e, _) => state = state.copyWith(
            blockUserState: BlockUserState.error(
              PeamanError(message: e.toString()),
            ),
          ),
          orElse: () {},
        );
  }

  Future<void> toggleBlockUnblock(final String friendId) async {
    await _ref.read(providerOfPeamanBlockedUsersStream).maybeWhen(
          data: (data) async {
            final blockedUids = data.map((e) => e.uid).toList();
            if (blockedUids.contains(friendId)) {
              await unblockUser(friendId: friendId);
            } else {
              await blockUser(friendId: friendId);
            }
          },
          orElse: () {},
        );
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
      (failure) => state.copyWith(
        updateUserState: UpdateUserState.error(failure),
      ),
    );
    return result;
  }
}
