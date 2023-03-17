import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/auth/providers/states/peaman_auth_provider_state.dart';
import 'package:peaman_ui_components/src/features/shared/providers/main_providers.dart';

final providerOfPeamanAuth =
    StateNotifierProvider<PeamanAuthProvider, PeamanAuthProviderState>(
  PeamanAuthProvider.new,
);

final providerOfPeamanAuthUser = StreamProvider<PeamanAuthUser?>((ref) {
  return ref.watch(providerOfPeamanAuthRepository).authUser;
});

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

  Future<void> signInWithEmailAndPassword() async {
    if (state.isLoading) return;
    if (state.emailController.text.trim().isEmpty ||
        state.passwordController.text.trim().isEmpty) return;

    setIsLoading(true);
    final resultEither = await _authRepository.signInWithEmailAndPassword(
      email: state.emailController.text.trim(),
      password: state.passwordController.text.trim(),
    );
    resultEither.either(
      (left) => null,
      (right) => null,
    );
    setIsLoading(false);
  }

  Future<void> signUpWithEmailAndPassword() async {
    if (state.isLoading) return;
    if (state.emailController.text.trim().isEmpty ||
        state.passwordController.text.trim().isEmpty ||
        state.confirmPasswordController.text.trim().isEmpty) return;

    setIsLoading(true);
    final user = PeamanUser(
      email: state.emailController.text.trim(),
    );
    final resultEither = await _authRepository.signUpWithEmailAndPassword(
      user: user,
      email: state.emailController.text.trim(),
      password: state.passwordController.text.trim(),
    );
    resultEither.either(
      (left) => null,
      (right) => null,
    );
    setIsLoading(false);
  }

  Future<void> signInWithGoogle() async {
    if (state.isLoading) return;

    setIsLoading(true);
    final resultEither = await _authRepository.signInWithGoogle();
    resultEither.either(
      (left) => null,
      (right) => null,
    );
    setIsLoading(false);
  }

  Future<void> signInWithFacebook() async {
    if (state.isLoading) return;

    setIsLoading(true);
    final resultEither = await _authRepository.signInWithFacebook();
    resultEither.either(
      (left) => null,
      (right) => null,
    );
    setIsLoading(false);
  }

  Future<void> signOut() async {
    setIsLoading(true);
    final resultEither = await _authRepository.signOut();
    resultEither.either(
      (left) => null,
      (right) => null,
    );
    setIsLoading(false);
  }

  void setIsLoading(final bool newVal) =>
      state = state.copyWith(isLoading: newVal);
}
