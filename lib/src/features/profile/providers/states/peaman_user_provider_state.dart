import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_user_provider_state.freezed.dart';

@freezed
class PeamanUserProviderState with _$PeamanUserProviderState {
  const factory PeamanUserProviderState({
    @Default(UpdateUserState.initial()) final UpdateUserState updateUserState,
  }) = _PeamanUserProviderState;
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
