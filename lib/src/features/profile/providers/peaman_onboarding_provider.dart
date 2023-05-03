import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanOnboarding = StateNotifierProvider.autoDispose<
    PeamanOnboardingProvider, PeamanOnboardingProviderState>((ref) {
  return PeamanOnboardingProvider(ref);
});

class PeamanOnboardingProvider
    extends StateNotifier<PeamanOnboardingProviderState> {
  PeamanOnboardingProvider(final Ref ref)
      : _ref = ref,
        super(
          PeamanOnboardingProviderState(
            nameController: TextEditingController(),
            usernameController: TextEditingController(),
            bioController: TextEditingController(),
          ),
        ) {
    _initializeValues();
  }

  final Ref _ref;
  PeamanUserProvider get _userProvider =>
      _ref.read(providerOfPeamanUser.notifier);
  PeamanUser get _appUser => _ref.read(providerOfLoggedInUser);
  PeamanStorageRepository get _storageRepository =>
      _ref.watch(providerOfPeamanStorageRepository);
  PeamanInfoProvider get _errorProvider =>
      _ref.read(providerOfPeamanInfo.notifier);

  void _initializeValues() {
    state = state.copyWith(
      nameController: TextEditingController()..text = _appUser.name ?? '',
      usernameController: TextEditingController()
        ..text = _appUser.userName ?? '',
      bioController: TextEditingController()..text = _appUser.bio ?? '',
      selectedProfilePicture: _appUser.photo.isNull
          ? null
          : PeamanFileUrlExtended(
              url: _appUser.photo!,
              type: PeamanFileType.image,
              isLocal: false,
            ),
      selectedCountry: _appUser.country,
      selectedDateOfBirth: _appUser.dob.isNull
          ? null
          : DateTime.fromMillisecondsSinceEpoch(_appUser.dob!),
      selectedGender: _appUser.gender,
      onboardingStep: _appUser.onboardingStep,
    );
  }

  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage.isNull) return;

    final file = PeamanFileUrlExtended(
      url: pickedImage!.path,
      type: PeamanFileType.image,
      isLocal: true,
    );
    state = state.copyWith(selectedProfilePicture: file);
  }

  Future<void> pickCountry({
    required final BuildContext context,
  }) async {
    return showCountryPicker(
      context: context,
      onSelect: (c) => state = state.copyWith(
        selectedCountry: c.name,
      ),
    );
  }

  Future<void> pickDateOfBirth({
    required final BuildContext context,
  }) async {
    final currentDate = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: state.selectedDateOfBirth ?? currentDate,
      firstDate: DateTime(1880, 1, 1),
      lastDate: currentDate,
    );

    if (pickedDate != null) {
      state = state.copyWith(selectedDateOfBirth: pickedDate);
    }
  }

  Future<void> pickGender({
    required final BuildContext context,
  }) {
    final options = <PeamanSelectableOption>[
      const PeamanSelectableOption(
        id: 0,
        title: 'Male',
      ),
      const PeamanSelectableOption(
        id: 0,
        title: 'Female',
      ),
      const PeamanSelectableOption(
        id: 0,
        title: 'Other',
      ),
    ];

    return PeamanDialogProvider(context).showBottomSheet(
      widget: PeamanSelectableOptionsBottomsheet(
        optionsBuilder: (context, ref) => options,
        activeIndex: state.selectedGender == PeamanGender.male
            ? 0
            : state.selectedGender == PeamanGender.female
                ? 1
                : state.selectedGender == PeamanGender.other
                    ? 2
                    : null,
        onSelectOption: (context, ref, option) {
          late PeamanGender gender;
          switch (option.title) {
            case 'Male':
              gender = PeamanGender.male;
              break;
            case 'Female':
              gender = PeamanGender.female;
              break;
            case 'Other':
              gender = PeamanGender.other;
              break;
            default:
              gender = PeamanGender.unknown;
          }
          state = state.copyWith(selectedGender: gender);
        },
      ),
    );
  }

  void scrollPage({
    required final BuildContext context,
    required final PageController controller,
  }) {
    controller.animateTo(
      MediaQuery.of(context).size.width / 1.1 * state.onboardingStep,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.ease,
    );
  }

  void onPressedNextBtn() {
    switch (state.onboardingStep) {
      case 0:
        _saveBasicInfo();
        break;
      case 1:
        _saveDetailedInfo();
        break;
      default:
    }
  }

  Future<void> _saveBasicInfo() async {
    PeamanError? error;
    if (state.nameController.text.trim().isEmpty) {
      error = const PeamanError(message: 'Full name cannot be empty');
    }
    if (state.usernameController.text.trim().isEmpty) {
      error = const PeamanError(message: 'Username cannot be empty');
    }
    if (state.selectedCountry.isNull) {
      error = const PeamanError(message: 'Country cannot be empty');
    }
    if (error != null) {
      state = state.copyWith(
        updateOnboardingInfoState: UpdateOnboardingInfoState.error(error),
      );
      return;
    }

    String? profilePicture;
    if (state.selectedProfilePicture != null &&
        state.selectedProfilePicture!.isLocal) {
      state = state.copyWith(
        isProfilePictureUploaded: false,
      );
      final result = await _storageRepository.uploadFile(
        path: 'users/${_appUser.uid}/profile',
        fileName: '${_appUser.uid}.jpg',
        file: File(state.selectedProfilePicture!.url),
        onProgress: (val) => state = state.copyWith(
          profilePictureUploadProgress: val,
        ),
      );
      profilePicture = result.when(
        (success) => success,
        (failure) => null,
      );

      if (result.isFailure) {
        state = state.copyWith(
          updateOnboardingInfoState: UpdateOnboardingInfoState.error(
            result.failure,
          ),
        );
        return;
      }

      await Future.delayed(const Duration(milliseconds: 1000), () {});
    }

    state = state.copyWith(
      updateOnboardingInfoState: const UpdateOnboardingInfoState.loading(),
      isProfilePictureUploaded: true,
    );

    final result = await _userProvider.updateUser(
      uid: _appUser.uid!,
      fields: [
        PeamanField(
          key: 'photo',
          value: profilePicture,
        ),
        PeamanField(
          key: 'name',
          value: state.nameController.text.trim(),
        ),
        PeamanField(
          key: 'userName',
          value: state.usernameController.text.trim(),
        ),
        PeamanField(
          key: 'country',
          value: state.selectedCountry,
        ),
        PeamanField(
          key: 'onboardingStep',
          value: state.onboardingStep + 1,
        ),
        PeamanField(
          key: 'searchKeys',
          value: _getSearchKeys(),
        ),
      ],
    );
    state = result.when(
      (success) => state.copyWith(
        updateOnboardingInfoState: UpdateOnboardingInfoState.success(success),
      ),
      (failure) {
        _errorProvider.logError(failure.message);
        return state.copyWith(
          updateOnboardingInfoState: UpdateOnboardingInfoState.error(failure),
        );
      },
    );
  }

  Future<void> _saveDetailedInfo() async {
    PeamanError? error;
    if (state.selectedDateOfBirth.isNull) {
      error = const PeamanError(message: 'Date of birth cannot be empty');
    }
    if (state.selectedGender == PeamanGender.unknown) {
      error = const PeamanError(message: 'Gender cannot be empty');
    }
    if (state.bioController.text.trim().isEmpty) {
      error = const PeamanError(message: 'Bio cannot be empty');
    }
    if (error != null) {
      state = state.copyWith(
        updateOnboardingInfoState: UpdateOnboardingInfoState.error(error),
      );
      return;
    }

    state = state.copyWith(
      updateOnboardingInfoState: const UpdateOnboardingInfoState.loading(),
    );
    final result = await _userProvider.updateUser(
      uid: _appUser.uid!,
      fields: [
        PeamanField(
          key: 'dob',
          value: state.selectedDateOfBirth!.millisecondsSinceEpoch,
        ),
        PeamanField(
          key: 'gender',
          value: ksPeamanGender[state.selectedGender],
        ),
        PeamanField(
          key: 'bio',
          value: state.bioController.text.trim(),
        ),
        PeamanField.positivePartial(
          key: 'searchKeys',
          value: _getSearchKeys(),
        ),
        const PeamanField(
          key: 'isOnboardingCompleted',
          value: true,
        ),
      ],
    );
    state = result.when(
      (success) => state.copyWith(
        updateOnboardingInfoState: UpdateOnboardingInfoState.success(success),
      ),
      (failure) {
        _errorProvider.logError(failure.message);
        return state.copyWith(
          updateOnboardingInfoState: UpdateOnboardingInfoState.error(failure),
        );
      },
    );
  }

  List<String> _getSearchKeys() {
    var searchKeys = <String>[];
    final name = state.nameController.text.trim();
    final userName = state.usernameController.text.trim();
    final bio = state.bioController.text.trim();
    final bios = bio.split(' ');

    // split letters of name
    for (int i = 0; i < name.length; i++) {
      final letter = name.substring(0, i + 1);
      if (!searchKeys.contains(letter.toUpperCase())) {
        searchKeys.add(letter.toUpperCase());
      }
    }
    //

    // split letters of userName
    for (int i = 0; i < userName.length; i++) {
      final letter = userName.substring(0, i + 1);
      if (!searchKeys.contains(letter.toUpperCase())) {
        searchKeys.add(letter.toUpperCase());
      }
    }
    //

    // split letters of bio
    for (int i = 0; i < bios.length; i++) {
      for (int j = 0; j < bios[i].length; j++) {
        final letter = bios[i].substring(0, j + 1);
        if (!searchKeys.contains(letter.toUpperCase())) {
          searchKeys.add(letter.toUpperCase());
        }
      }
    }
    //

    return searchKeys
        .where((element) =>
            element.trim() != '' &&
            element.trim() != ',' &&
            element.trim() != '.')
        .toList();
  }

  void setOnboardingStep(final int newVal) {
    state = state.copyWith(onboardingStep: newVal);
  }
}
