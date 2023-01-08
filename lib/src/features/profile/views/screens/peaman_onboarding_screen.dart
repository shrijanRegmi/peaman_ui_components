import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanOnboardingScreen extends PeamanWidget<PeamanOnboardingVM> {
  const PeamanOnboardingScreen({super.key});

  List<Widget> _steps(final PeamanOnboardingVM vm) {
    return [
      PeamanOnboardingBasicInfoStep(
        nameController: vm.nameController,
        userNameController: vm.userNameController,
        onImagePick: vm.pickImage,
        onCountryPick: vm.selectCountry,
        profileImg: vm.profileImg,
        profileImgUploadProgress: vm.profileImgUploadProgress,
        profileImgUploadCompleted: vm.profileImgUploadCompleted,
        country: vm.selectedCountry,
      ),
      PeamanOnboardingDetailsInfoStep(
        selectedBirthday: vm.dob,
        selectedGender: vm.gender,
        bioController: vm.bioController,
        onSelectBirthday: vm.selectBirthday,
        onSelectGender: vm.selectGender,
      ),
    ];
  }

  @override
  Widget build(BuildContext context, PeamanOnboardingVM vm) {
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
                      vm.step > 0
                          ? GestureDetector(
                              onTap: () {
                                vm.updateStep(vm.step - 1);
                                vm.scrollPage(reversed: true);
                              },
                              behavior: HitTestBehavior.opaque,
                              child: const Icon(Icons.navigate_before),
                            )
                          : const SizedBox(),
                      GestureDetector(
                        onTap: vm.logout,
                        behavior: HitTestBehavior.opaque,
                        child: const Icon(Icons.logout),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  _headerBuilder(vm),
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    height: 470.0,
                    child: PageView.builder(
                      controller: vm.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _steps(vm).length,
                      itemBuilder: (context, index) {
                        return _steps(vm)[index];
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _buttonBuilder(vm),
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

  Widget _headerBuilder(final PeamanOnboardingVM vm) {
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
        const PeamanText.subtitle1(
          "Tell us more about yourself",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buttonBuilder(final PeamanOnboardingVM vm) {
    return PeamanButton.filled(
      value: 'Next',
      minWidth: 100.0,
      padding: const EdgeInsets.all(18.0),
      borderRadius: 15.0,
      isLoading: vm.isLoading,
      onPressed: vm.onPressedNext,
    );
  }

  @override
  PeamanOnboardingVM onCreateVM(BuildContext context) =>
      PeamanOnboardingVM(context: context);

  @override
  void onDispose(BuildContext context, PeamanOnboardingVM vm) {}

  @override
  void onInit(BuildContext context, PeamanOnboardingVM vm) => vm.onInit();
}
