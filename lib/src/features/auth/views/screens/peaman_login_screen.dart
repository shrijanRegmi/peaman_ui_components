import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanLoginScreen extends StatefulHookConsumerWidget {
  const PeamanLoginScreen({super.key});

  static const route = '/peaman_login_screen';

  @override
  ConsumerState<PeamanLoginScreen> createState() => _PeamanLoginScreenState();
}

class _PeamanLoginScreenState extends ConsumerState<PeamanLoginScreen> {
  PeamanAuthProviderState get state => ref.watch(providerOfPeamanAuth);
  PeamanAuthProvider get notifier => ref.read(providerOfPeamanAuth.notifier);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  _recoveryPasswordBuilder(),
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
                    height: 100.0,
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
          'Hello Again!',
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 28.0,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        const PeamanText.subtitle1(
          "Welcome back, we had\nmissed you a lot!",
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
          requiredPadding: false,
          controller: _emailController,
        ),
        const SizedBox(
          height: 15.0,
        ),
        PeamanInput(
          hintText: 'Password',
          password: true,
          requiredPadding: false,
          controller: _emailController,
        ),
      ],
    );
  }

  Widget _recoveryPasswordBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        PeamanText.subtitle2(
          'Password Recovery?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buttonBuilder() {
    return PeamanButton.filled(
      value: 'Sign In',
      isLoading: state.signInWithEmailPasswordState.maybeWhen(
        loading: () => true,
        orElse: () => false,
      ),
      onPressed: () {
        context.unfocus();
        notifier.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      },
    );
  }

  Widget _otherOptionsTitleBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: const [
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
          'Not a member?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.pushNamed(PeamanSignUpScreen.route),
          child: PeamanText.subtitle2(
            ' Register now',
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
