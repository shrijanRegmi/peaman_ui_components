import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanAuth =
    StateNotifierProvider<PeamanAuthProvider, PeamanAuthProviderState>(
  PeamanAuthProvider.new,
);

final providerOfPeamanAuthUserStream = StreamProvider<PeamanAuthUser?>((ref) {
  return ref.watch(providerOfPeamanAuthRepository).authUser;
});

final providerOfPeamanAuthUser = Provider<PeamanAuthUser?>((ref) {
  final authUserStream = ref.watch(providerOfPeamanAuthUserStream);
  return authUserStream.maybeWhen(
    data: (data) => data,
    orElse: () => null,
  );
});

final providerOfLoggedInUserStream = StreamProvider<PeamanUser?>((ref) {
  final authUserStream = ref.watch(providerOfPeamanAuthUserStream);

  return authUserStream.maybeWhen(
    data: (data) {
      if (data.isNull) {
        return () async* {
          yield null;
        } as Stream<PeamanUser?>;
      }

      return ref
          .watch(providerOfPeamanUserRepository)
          .getSingleUserStream(uid: data!.uid);
    },
    orElse: () async* {},
  );
});

final providerOfLoggedInUser = Provider<PeamanUser>((ref) {
  final appUserStream = ref.watch(providerOfLoggedInUserStream);
  final loggedInUser = appUserStream.maybeWhen(
    data: (data) => data,
    orElse: () => null,
  );
  assert(loggedInUser != null, 'Logged in user cannot be null!');
  return loggedInUser!;
});

final providerOfSingleUserByIdFuture =
    FutureProvider.family<PeamanEither<PeamanUser, PeamanError>, String>(
  (ref, uid) {
    return ref.watch(providerOfPeamanUserRepository).getSingleUser(uid: uid);
  },
);

class PeamanAuthProvider extends StateNotifier<PeamanAuthProviderState> {
  PeamanAuthProvider(final Ref ref)
      : _ref = ref,
        super(
          PeamanAuthProviderState(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            confirmPasswordController: TextEditingController(),
          ),
        );

  final Ref _ref;
  PeamanAuthRepository get _authRepository =>
      _ref.watch(providerOfPeamanAuthRepository);
  PeamanInfoProvider get _errorProvider =>
      _ref.read(providerOfPeamanInfo.notifier);

  Future<void> signInWithEmailAndPassword() async {
    if (state.emailController.text.trim().isEmpty ||
        state.passwordController.text.trim().isEmpty) return;

    state = state.copyWith(
      signInWithEmailPasswordState:
          const SignInWithEmailPasswordState.loading(),
    );
    final result = await _authRepository.signInWithEmailAndPassword(
      email: state.emailController.text.trim(),
      password: state.passwordController.text.trim(),
    );
    state = result.when(
      (success) => state.copyWith(
        signInWithEmailPasswordState:
            SignInWithEmailPasswordState.success(success),
      ),
      (failure) {
        _errorProvider.logError(_getHandledError(failure).message);
        return state.copyWith(
          signInWithEmailPasswordState:
              SignInWithEmailPasswordState.error(failure),
        );
      },
    );
  }

  Future<void> signUpWithEmailAndPassword() async {
    if (state.emailController.text.trim().isEmpty ||
        state.passwordController.text.trim().isEmpty ||
        state.confirmPasswordController.text.trim().isEmpty) return;

    final user = PeamanUser(
      email: state.emailController.text.trim(),
    );
    state = state.copyWith(
      signUpWithEmailPasswordState:
          const SignUpWithEmailPasswordState.loading(),
    );
    final result = await _authRepository.signUpWithEmailAndPassword(
      user: user,
      email: state.emailController.text.trim(),
      password: state.passwordController.text.trim(),
    );
    state = result.when(
      (success) => state.copyWith(
        signUpWithEmailPasswordState:
            SignUpWithEmailPasswordState.success(success),
      ),
      (failure) {
        _errorProvider.logError(_getHandledError(failure).message);
        return state.copyWith(
          signUpWithEmailPasswordState:
              SignUpWithEmailPasswordState.error(failure),
        );
      },
    );
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(
      signInWithGoogleState: const SignInWithGoogleState.loading(),
    );
    final result = await _authRepository.signInWithGoogle();
    state = result.when(
      (success) => state.copyWith(
        signInWithGoogleState: SignInWithGoogleState.success(success),
      ),
      (failure) {
        _errorProvider.logError(_getHandledError(failure).message);
        return state.copyWith(
          signInWithGoogleState: SignInWithGoogleState.error(failure),
        );
      },
    );
  }

  Future<void> signInWithFacebook() async {
    state = state.copyWith(
      signInWithFacebookState: const SignInWithFacebookState.loading(),
    );
    final result = await _authRepository.signInWithFacebook();
    state = result.when(
      (success) => state.copyWith(
        signInWithFacebookState: SignInWithFacebookState.success(success),
      ),
      (failure) {
        _errorProvider.logError(_getHandledError(failure).message);
        return state.copyWith(
          signInWithFacebookState: SignInWithFacebookState.error(failure),
        );
      },
    );
  }

  Future<void> signOut() async {
    state = state.copyWith(
      signOutState: const SignOutState.loading(),
    );
    final result = await _authRepository.signOut();
    state = result.when(
      (success) {
        return state.copyWith(
          signOutState: SignOutState.success(success),
        );
      },
      (failure) {
        _errorProvider.logError(_getHandledError(failure).message);
        return state.copyWith(
          signOutState: SignOutState.error(failure),
        );
      },
    );
  }

  PeamanError _getHandledError(final PeamanError error) {
    var handledError = error;
    switch (error.code) {
      case 'wrong-password':
        handledError = handledError.copyWith(
          message: 'The password you have entered is wrong.',
        );
        break;
      default:
    }

    return handledError;
  }
}
