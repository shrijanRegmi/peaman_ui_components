import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanLoginScreen extends PeamanWidget<PeamanAuthVM> {
  const PeamanLoginScreen({super.key});

  @override
  Widget build(BuildContext context, PeamanAuthVM vm) {
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
                  _inputsBuilder(vm),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _recoveryPasswordBuilder(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _buttonBuilder(vm),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _otherOptionsTitleBuilder(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _otherOptionsBuilder(vm),
                  const SizedBox(
                    height: 100.0,
                  ),
                  _notAMemberBuilder(vm),
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

  Widget _inputsBuilder(final PeamanAuthVM vm) {
    return Column(
      children: [
        PeamanInput(
          hintText: 'Email address',
          requiredPadding: false,
          controller: vm.emailController,
        ),
        const SizedBox(
          height: 15.0,
        ),
        PeamanInput(
          hintText: 'Password',
          password: true,
          requiredPadding: false,
          controller: vm.passwordController,
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

  Widget _buttonBuilder(final PeamanAuthVM vm) {
    return PeamanButton.filled(
      value: 'Sign In',
      minWidth: double.infinity,
      padding: const EdgeInsets.all(18.0),
      borderRadius: 15.0,
      isLoading: vm.isLoading,
      onPressed: vm.loginWithEmailPassword,
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

  Widget _otherOptionsBuilder(final PeamanAuthVM vm) {
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
              onPressed: vm.signInWithGoogle,
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
              onPressed: vm.signInWithFacebook,
            ),
          ),
        ],
      ),
    );
  }

  Widget _notAMemberBuilder(final PeamanAuthVM vm) {
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
          onTap: () {
            vm.navigateNamed(
              PeamanRoutes.signUpScreen,
            );
          },
          child: PeamanText.subtitle2(
            ' Register now',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: vm.context.theme.colorScheme.secondary,
            ),
          ),
        )
      ],
    );
  }

  @override
  PeamanAuthVM onCreateVM(BuildContext context) => PeamanAuthVM(context);

  @override
  void onDispose(BuildContext context, PeamanAuthVM vm) {}

  @override
  void onInit(BuildContext context, PeamanAuthVM vm) {}
}
