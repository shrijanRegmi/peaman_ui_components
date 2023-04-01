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
