import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanAuthVM extends PeamanBaseVM {
  PeamanAuthVM(
    final BuildContext context,
  ) : super(context: context);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  // login with email and password
  void loginWithEmailPassword() {
    if (_emailController.text.trim() == '' ||
        _passwordController.text.trim() == '' ||
        isLoading) return;

    updateIsLoading(true);
    PAuthProvider.loginWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      onError: (e) {
        updateIsLoading(false);
        logError(
          message:
              'The user with that email does not exist! Please create a new account with that email',
        );
      },
    );
  }

  // sign up with email and password
  void signUpWithEmailPassword() {
    if (_emailController.text.trim() == '' ||
        _passwordController.text.trim() == '' ||
        isLoading) return;

    updateIsLoading(true);
    PAuthProvider.signUpWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      appUser: PeamanUser(
        email: _emailController.text.trim(),
      ),
      onSuccess: (_) => popNavigate(),
      onError: (e) {
        updateIsLoading(false);
        logError(
          message:
              'The user with that email does not exist! Please create a new account with that email',
        );
      },
    );
  }

  // sign in with google
  void signInWithGoogle() {
    if (isLoading) return;

    updateIsLoading(true);
    PAuthProvider.signInWithGoogle(
      onError: (e) {
        updateIsLoading(false);
        logError(message: '');
      },
    );
  }

  // sign in with google
  void signInWithFacebook() {
    if (isLoading) return;

    updateIsLoading(true);
    PAuthProvider.signInWithFacebook(
      onError: (e) {
        updateIsLoading(false);
        logError(message: '');
      },
    );
  }
}
