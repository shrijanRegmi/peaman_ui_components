import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_auth_provider_state.freezed.dart';

@freezed
class PeamanAuthProviderState with _$PeamanAuthProviderState {
  const factory PeamanAuthProviderState({
    @Default(SignInWithEmailPasswordState.initial())
        final SignInWithEmailPasswordState signInWithEmailPasswordState,
    @Default(SignUpWithEmailPasswordState.initial())
        final SignUpWithEmailPasswordState signUpWithEmailPasswordState,
    @Default(SignInWithGoogleState.initial())
        final SignInWithGoogleState signInWithGoogleState,
    @Default(SignInWithFacebookState.initial())
        final SignInWithFacebookState signInWithFacebookState,
    @Default(SignOutState.initial()) final SignOutState signOutState,
  }) = _PeamanAuthProviderState;
}

@freezed
class SignInWithEmailPasswordState with _$SignInWithEmailPasswordState {
  const factory SignInWithEmailPasswordState.initial() =
      _SignInWithEmailPasswordStateInitial;
  const factory SignInWithEmailPasswordState.loading() =
      _SignInWithEmailPasswordStateLoading;
  const factory SignInWithEmailPasswordState.success(
    final bool result,
  ) = _SignInWithEmailPasswordStateSuccess;
  const factory SignInWithEmailPasswordState.error(
    final PeamanError error,
  ) = _SignInWithEmailPasswordStateFailure;
}

@freezed
class SignUpWithEmailPasswordState with _$SignUpWithEmailPasswordState {
  const factory SignUpWithEmailPasswordState.initial() =
      _SignUpWithEmailPasswordStateInitial;
  const factory SignUpWithEmailPasswordState.loading() =
      _SignUpWithEmailPasswordStateLoading;
  const factory SignUpWithEmailPasswordState.success(
    final PeamanUser result,
  ) = _SignUpWithEmailPasswordStateSuccess;
  const factory SignUpWithEmailPasswordState.error(
    final PeamanError error,
  ) = _SignUpWithEmailPasswordStateFailure;
}

@freezed
class SignInWithGoogleState with _$SignInWithGoogleState {
  const factory SignInWithGoogleState.initial() = _SignInWithGoogleStateInitial;
  const factory SignInWithGoogleState.loading() = _SignInWithGoogleStateLoading;
  const factory SignInWithGoogleState.success(
    final bool result,
  ) = _SignInWithGoogleStateSuccess;
  const factory SignInWithGoogleState.error(
    final PeamanError error,
  ) = _SignInWithGoogleStateFailure;
}

@freezed
class SignInWithFacebookState with _$SignInWithFacebookState {
  const factory SignInWithFacebookState.initial() =
      _SignInWithFacebookStateInitial;
  const factory SignInWithFacebookState.loading() =
      _SignInWithFacebookStateLoading;
  const factory SignInWithFacebookState.success(
    final bool result,
  ) = _SignInWithFacebookStateSuccess;
  const factory SignInWithFacebookState.error(
    final PeamanError error,
  ) = _SignInWithFacebookStateFailure;
}

@freezed
class SignOutState with _$SignOutState {
  const factory SignOutState.initial() = _SignOutStateInitial;
  const factory SignOutState.loading() = _SignOutStateLoading;
  const factory SignOutState.success(
    final bool result,
  ) = _SignOutStateSuccess;
  const factory SignOutState.error(
    final PeamanError error,
  ) = _SignOutStateFailure;
}
