import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_user_provider_state.freezed.dart';

@freezed
class PeamanUserProviderState with _$PeamanUserProviderState {
  const factory PeamanUserProviderState({
    @Default(UpdateUserState.initial()) final UpdateUserState updateUserState,
    @Default(BlockUserState.initial()) final BlockUserState blockUserState,
    @Default(UnblockUserState.initial())
        final UnblockUserState unblockUserState,
    @Default(FollowUserState.initial()) final FollowUserState followUserState,
    @Default(UnfollowUserState.initial())
        final UnfollowUserState unfollowUserState,
    @Default(CancelFollowState.initial())
        final CancelFollowState cancelFollowState,
    @Default(AcceptFollowState.initial())
        final AcceptFollowState acceptFollowState,
    @Default(FollowBackState.initial()) final FollowBackState followBackState,
  }) = _PeamanUserProviderState;
}

@freezed
class BlockUserState with _$BlockUserState {
  const factory BlockUserState.initial() = _BlockUserStateInitial;
  const factory BlockUserState.loading() = _BlockUserStateLoading;
  const factory BlockUserState.success(final bool result) =
      _BlockUserStateSuccess;
  const factory BlockUserState.error(final PeamanError error) =
      _BlockUserStateError;
}

@freezed
class UnblockUserState with _$UnblockUserState {
  const factory UnblockUserState.initial() = _UnblockUserStateInitial;
  const factory UnblockUserState.loading() = _UnblockUserStateLoading;
  const factory UnblockUserState.success(final bool result) =
      _UnblockUserStateSuccess;
  const factory UnblockUserState.error(final PeamanError error) =
      _UnblockUserStateError;
}

@freezed
class UpdateUserState with _$UpdateUserState {
  const factory UpdateUserState.initial() = _UpdateUserStateInitial;
  const factory UpdateUserState.loading() = _UpdateUserStateLoading;
  const factory UpdateUserState.success(final bool result) =
      _UpdateUserStateSuccess;
  const factory UpdateUserState.error(final PeamanError error) =
      _UpdateUserStateError;
}

@freezed
class FollowUserState with _$FollowUserState {
  const factory FollowUserState.initial() = _FollowUserStateInitial;
  const factory FollowUserState.loading() = _FollowUserStateLoading;
  const factory FollowUserState.success(final bool result) =
      _FollowUserStateSuccess;
  const factory FollowUserState.error(final PeamanError error) =
      _FollowUserStateError;
}

@freezed
class UnfollowUserState with _$UnfollowUserState {
  const factory UnfollowUserState.initial() = _UnfollowUserStateInitial;
  const factory UnfollowUserState.loading() = _UnfollowUserStateLoading;
  const factory UnfollowUserState.success(final bool result) =
      _UnfollowUserStateSuccess;
  const factory UnfollowUserState.error(final PeamanError error) =
      _UnfollowUserStateError;
}

@freezed
class CancelFollowState with _$CancelFollowState {
  const factory CancelFollowState.initial() = _CancelFollowStateInitial;
  const factory CancelFollowState.loading() = _CancelFollowStateLoading;
  const factory CancelFollowState.success(final bool result) =
      _CancelFollowStateSuccess;
  const factory CancelFollowState.error(final PeamanError error) =
      _CancelFollowStateError;
}

@freezed
class AcceptFollowState with _$AcceptFollowState {
  const factory AcceptFollowState.initial() = _AcceptFollowStateInitial;
  const factory AcceptFollowState.loading() = _AcceptFollowStateLoading;
  const factory AcceptFollowState.success(final bool result) =
      _AcceptFollowStateSuccess;
  const factory AcceptFollowState.error(final PeamanError error) =
      _AcceptFollowStateError;
}

@freezed
class FollowBackState with _$FollowBackState {
  const factory FollowBackState.initial() = _FollowBackStateInitial;
  const factory FollowBackState.loading() = _FollowBackStateLoading;
  const factory FollowBackState.success(final bool result) =
      _FollowBackStateSuccess;
  const factory FollowBackState.error(final PeamanError error) =
      _FollowBackStateError;
}
