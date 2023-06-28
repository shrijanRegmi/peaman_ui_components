import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanSignUpScreen extends StatefulHookConsumerWidget {
  const PeamanSignUpScreen({super.key});

  static const route = '/peaman_signup_screen';

  @override
  ConsumerState<PeamanSignUpScreen> createState() => _PeamanSignUpScreenState();
}

class _PeamanSignUpScreenState extends ConsumerState<PeamanSignUpScreen> {
  PeamanAuthProviderState get state => ref.watch(providerOfPeamanAuth);
  PeamanAuthProvider get notifier => ref.read(providerOfPeamanAuth.notifier);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(providerOfPeamanAuth, (previous, next) {
      if (next.signUpWithEmailPasswordState !=
          previous?.signUpWithEmailPasswordState) {
        next.signUpWithEmailPasswordState.maybeWhen(
          success: (success) => context.pushNamedAndRemoveUntil(
            PeamanWrapper.route,
          ),
          orElse: () {},
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              behavior: HitTestBehavior.opaque,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  _headerBuilder(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _inputsBuilder(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _buttonBuilder(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _otherOptionsTitleBuilder(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _otherOptionsBuilder(),
                  const SizedBox(
                    height: 75.0,
                  ),
                  _notAMemberBuilder(),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerBuilder() {
    return Column(
      children: [
        PeamanText.heading5(
          'Register',
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 28.0,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        const PeamanText.subtitle1(
          "Thanks, we are glad to\nhave you onboard",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _inputsBuilder() {
    return Column(
      children: [
        PeamanInput(
          hintText: 'Email address',
          controller: _emailController,
        ),
        const SizedBox(
          height: 15.0,
        ),
        PeamanInput(
          hintText: 'Password',
          password: true,
          controller: _passwordController,
        ),
        const SizedBox(
          height: 15.0,
        ),
        PeamanInput(
          hintText: 'Confirm Password',
          password: true,
          controller: _confirmPasswordController,
        ),
      ],
    );
  }

  Widget _buttonBuilder() {
    return PeamanButton.filled(
      value: 'Register',
      isLoading: state.signUpWithEmailPasswordState.maybeWhen(
        loading: () => true,
        orElse: () => false,
      ),
      onPressed: () {
        context.unfocus();
        notifier.signUpWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          confirmPassword: _confirmPasswordController.text.trim(),
        );
      },
    );
  }

  Widget _otherOptionsTitleBuilder() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1.0,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          PeamanText.subtitle2(
            'or continue with',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Divider(
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _otherOptionsBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: PeamanButton.bordered(
              icon: CachedNetworkImage(
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png',
                width: 20.0,
                height: 20.0,
              ),
              borderRadius: 15.0,
              borderSide: const BorderSide(
                color: PeamanColors.lightGrey,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              isLoading: state.signInWithGoogleState.maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
              onPressed: () {
                context.unfocus();
                notifier.signInWithGoogle();
              },
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: PeamanButton.bordered(
              icon: CachedNetworkImage(
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/1365px-Facebook_f_logo_%282019%29.svg.png',
                width: 20.0,
                height: 20.0,
              ),
              borderRadius: 15.0,
              borderSide: const BorderSide(
                color: PeamanColors.lightGrey,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              isLoading: state.signInWithFacebookState.maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
              onPressed: () {
                context.unfocus();
                notifier.signInWithFacebook();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _notAMemberBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const PeamanText.subtitle2(
          'Already a member?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: context.pop,
          child: PeamanText.subtitle2(
            ' Login now',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.theme.colorScheme.secondary,
            ),
          ),
        )
      ],
    );
  }
}
