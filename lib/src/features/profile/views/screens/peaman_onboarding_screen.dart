import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanOnboardingScreen extends StatefulHookConsumerWidget {
  const PeamanOnboardingScreen({super.key});

  static const route = '/peaman_onboarding_screen';

  @override
  ConsumerState<PeamanOnboardingScreen> createState() =>
      _PeamanOnboardingScreenState();
}

class _PeamanOnboardingScreenState
    extends ConsumerState<PeamanOnboardingScreen> {
  PeamanOnboardingProviderState get state =>
      ref.watch(providerOfPeamanOnboarding);
  PeamanOnboardingProvider get notifier =>
      ref.read(providerOfPeamanOnboarding.notifier);

  List<Widget> get _steps {
    return [
      PeamanOnboardingBasicInfoStep(
        nameController: state.nameController,
        userNameController: state.usernameController,
        profilePicture: state.selectedProfilePicture,
        country: state.selectedCountry,
        onImagePick: notifier.pickImage,
        onCountryPick: () => notifier.pickCountry(
          context: context,
        ),
        profilePictureUploadProgress: state.profilePictureUploadProgress,
        isProfilePictureUploaded: state.isProfilePictureUploaded,
      ),
      PeamanOnboardingDetailsInfoStep(
        selectedBirthday: state.selectedDateOfBirth,
        selectedGender: state.selectedGender,
        bioController: state.bioController,
        onSelectBirthday: () => notifier.pickDateOfBirth(
          context: context,
        ),
        onSelectGender: () => notifier.pickGender(
          context: context,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(
      initialPage: state.onboardingStep,
    );

    ref.listen(providerOfPeamanOnboarding, (previous, next) {
      if (next.updateOnboardingInfoState !=
          previous?.updateOnboardingInfoState) {
        next.updateOnboardingInfoState.maybeWhen(
          success: (val) {
            notifier.setOnboardingStep(state.onboardingStep + 1);
            notifier.scrollPage(context: context, controller: pageController);
          },
          error: (val) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: PeamanText.body1(val.message)),
            );
          },
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
                    height: 13.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.onboardingStep > 0
                          ? GestureDetector(
                              onTap: () {
                                notifier.setOnboardingStep(
                                  state.onboardingStep - 1,
                                );
                                notifier.scrollPage(
                                  context: context,
                                  controller: pageController,
                                );
                              },
                              behavior: HitTestBehavior.opaque,
                              child: const Icon(Icons.navigate_before),
                            )
                          : const SizedBox(),
                      GestureDetector(
                        onTap: () =>
                            ref.read(providerOfPeamanAuth.notifier).signOut(),
                        behavior: HitTestBehavior.opaque,
                        child: const Icon(Icons.logout),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  _headerBuilder(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    height: 470.0,
                    child: PageView.builder(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _steps.length,
                      itemBuilder: (context, index) {
                        return _steps[index];
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _buttonBuilder(),
                  const SizedBox(
                    height: 10.0,
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
          "Let's begin!",
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 28.0,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        PeamanText.subtitle1(
          "Tell us more about yourself",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buttonBuilder() {
    final isLoading = state.updateOnboardingInfoState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    return PeamanButton.filled(
      value: 'Next',
      minWidth: 100.0,
      padding: const EdgeInsets.all(18.0),
      borderRadius: 15.0,
      isLoading: isLoading,
      onPressed: notifier.onPressedNextBtn,
    );
  }
}
