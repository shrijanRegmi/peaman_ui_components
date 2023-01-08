import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanOnboardingVM extends PeamanBaseVM {
  PeamanOnboardingVM({required super.context});

  final _nameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _bioController = TextEditingController();
  PeamanPicture? _profileImg;
  String? _selectedCountry;
  DateTime? _dob;
  PeamanGender _gender = PeamanGender.unknown;
  PageController? _pageController;
  int _step = 0;
  bool _isProfileUpdated = false;
  double _profileImgUploadProgress = 0.0;
  bool _profileImgUploadCompleted = true;

  TextEditingController get nameController => _nameController;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get bioController => _bioController;
  PeamanPicture? get profileImg => _profileImg;
  String? get selectedCountry => _selectedCountry;
  PeamanGender get gender => _gender;
  DateTime? get dob => _dob;
  PageController? get pageController => _pageController;
  int get step => _step;
  bool get isProfileUpdated => _isProfileUpdated;
  double get profileImgUploadProgress => _profileImgUploadProgress;
  bool get profileImgUploadCompleted => _profileImgUploadCompleted;

  // init function
  void onInit() {
    _initializeValues();
  }

  // logout user
  void logout() {
    PAuthProvider.logOut();
  }

  // pick image
  void pickImage() async {
    if (!_profileImgUploadCompleted) return;
    final pickedImg = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImg != null) {
      _profileImg = PeamanPicture(
        path: pickedImg.path,
        type: PeamanPictureType.file,
      );
      notifyListeners();
    }
  }

  // on pressed next button
  void onPressedNext() {
    if (isLoading) return;

    switch (_step) {
      case 0:
        _updateBasicInfoStep(onSuccess: () {
          updateStep(_step + 1);
          scrollPage();
        });
        break;
      case 1:
        _updateDetailsInfoStep(onSuccess: () {
          updateStep(_step + 1);
          scrollPage();
          onOnboardingCompleted();
        });
        break;

      default:
    }
  }

  // on boarding completed
  void onOnboardingCompleted() {
    PUserProvider.setUserOnboardingCompleted(
      uid: appUserReadOnly.uid!,
      onboardingCompleted: true,
    );
  }

  // scroll page
  void scrollPage({final bool reversed = false}) {
    _pageController?.animateTo(
      MediaQuery.of(context).size.width / 1.1 * _step,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.ease,
    );
  }

  // select birthday
  void selectBirthday() async {
    final currentDate = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _dob ?? currentDate,
      firstDate: DateTime(1880, 1, 1),
      lastDate: currentDate,
    );

    if (pickedDate != null) {
      updateDob(pickedDate);
    }
  }

  // select gender
  void selectGender() {
    final options = <PeamanSelectableOption>[
      PeamanSelectableOption(
        title: 'Male',
      ),
      PeamanSelectableOption(
        title: 'Female',
      ),
      PeamanSelectableOption(
        title: 'Other',
      ),
    ];

    dialogProvider.showBottomSheet(
      borderRadius: 15.0,
      widget: PeamanSelectableOptionsBottomsheet(
        options: options,
        activeIndex: _gender == PeamanGender.male
            ? 0
            : _gender == PeamanGender.female
                ? 1
                : _gender == PeamanGender.other
                    ? 2
                    : null,
        onSelectOption: (option) {
          switch (option.title) {
            case 'Male':
              updateGender(PeamanGender.male);
              break;
            case 'Female':
              updateGender(PeamanGender.female);
              break;
            case 'Other':
              updateGender(PeamanGender.other);
              break;
            default:
              updateGender(PeamanGender.unknown);
          }
        },
      ),
    );
  }

  // select country
  void selectCountry() {
    showCountryPicker(
      searchAutofocus: true,
      countryListTheme: const CountryListThemeData(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      context: context,
      onSelect: (country) {
        _selectedCountry = country.name;
        notifyListeners();
      },
    );
  }

  // save all
  void saveAll() async {
    if (_nameController.text.trim() == '') {
      return logError(message: 'Please provide your full name');
    }
    if (_userNameController.text.trim() == '') {
      return logError(message: 'Please provide your username');
    }
    if (_bioController.text.trim() == '') {
      return logError(message: 'Please enter your bio to continue');
    }
    if (_selectedCountry == null) {
      return logError(message: 'Please provide your country');
    }
    if (_dob == null) {
      return logError(message: 'Please provide your birthday');
    }
    if (_gender == PeamanGender.unknown) {
      return logError(message: 'Please provide your gender');
    }

    updateIsLoading(true);
    final userNameAlreadyExists =
        await PUserProvider().checkForExistingUsername(
      uid: appUserReadOnly.uid!,
      userName: _userNameController.text.trim(),
    );
    updateIsLoading(false);
    if (userNameAlreadyExists) {
      return logError(
        message: 'The username is not available. Please use a different one.',
      );
    }

    // upload photo
    final currentDate = DateTime.now();
    String? photo;
    if (_profileImg != null && _profileImg?.type == PeamanPictureType.file) {
      final uploadPath =
          'users/${appUserReadOnly.uid}/profiles/${currentDate.millisecondsSinceEpoch}.jpg';
      final imgFile = File(_profileImg!.path);
      updateProfileImgUploadCompleted(false);
      updateIsLoading(true);
      photo = await PStorageProvider.uploadFile(
        path: uploadPath,
        file: imgFile,
        onProgressUpdate: updateProfileImgUploadProgress,
      );

      Future.delayed(const Duration(milliseconds: 2000), () {
        updateProfileImgUploadCompleted(true);
      });

      if (photo != null) {
        _profileImg = PeamanPicture(
          path: photo,
          type: PeamanPictureType.network,
        );
      }
    } else if (_profileImg != null &&
        _profileImg?.type == PeamanPictureType.network) {
      photo = _profileImg!.path;
    }
    //

    final userUpdater = PeamanUserUpdater(
      photo: photo,
      name: _nameController.text.trim(),
      userName: _userNameController.text.trim(),
      country: _selectedCountry,
      searchKeys: _getSearchKeys(),
      dob: _dob?.millisecondsSinceEpoch,
      gender: _gender,
      bio: _bioController.text.trim(),
    );

    updateIsLoading(true);
    await _updateProfile(userUpdater);
    updateIsLoading(false);

    updateIsProfileUpdated(true);
    Future.delayed(const Duration(milliseconds: 3000), () {
      updateIsProfileUpdated(false);
    });
  }

  // initialize values
  void _initializeValues() {
    _step = appUserReadOnly.onboardingStep;
    _pageController = PageController(
      initialPage: appUserReadOnly.onboardingStep,
    );
    _nameController.text = appUserReadOnly.name ?? '';
    _userNameController.text = appUserReadOnly.userName ?? '';
    _selectedCountry = appUserReadOnly.country ?? '';
    _bioController.text = appUserReadOnly.bio ?? '';
    _profileImg = appUserReadOnly.photo == null
        ? null
        : PeamanPicture(
            path: appUserReadOnly.photo!,
            type: PeamanPictureType.network,
          );
    _dob = appUserReadOnly.dob == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(appUserReadOnly.dob!);
    _gender = appUserReadOnly.gender;
    notifyListeners();
  }

  // STEP - 0 : update basic info step
  void _updateBasicInfoStep({final Function()? onSuccess}) async {
    if (_nameController.text.trim() == '') {
      return logError(message: 'Please provide your full name');
    }
    if (_userNameController.text.trim() == '') {
      return logError(message: 'Please provide your username');
    }
    if (_selectedCountry == null) {
      return logError(message: 'Please provide your country');
    }

    updateIsLoading(true);
    final userNameAlreadyExists =
        await PUserProvider().checkForExistingUsername(
      uid: appUserReadOnly.uid!,
      userName: _userNameController.text.trim(),
    );
    updateIsLoading(false);
    if (userNameAlreadyExists) {
      return logError(
        message: 'The username is not available. Please use a different one.',
      );
    }

    final currentDate = DateTime.now();
    String? photo;
    if (_profileImg != null && _profileImg?.type == PeamanPictureType.file) {
      final uploadPath =
          'users/${appUserReadOnly.uid}/profiles/${currentDate.millisecondsSinceEpoch}.jpg';
      final imgFile = File(_profileImg!.path);
      updateIsLoading(true);
      updateProfileImgUploadCompleted(false);
      photo = await PStorageProvider.uploadFile(
        path: uploadPath,
        file: imgFile,
        onProgressUpdate: updateProfileImgUploadProgress,
      );
      Future.delayed(const Duration(milliseconds: 2000), () {
        updateProfileImgUploadCompleted(true);
      });

      if (photo != null) {
        _profileImg = PeamanPicture(
          path: photo,
          type: PeamanPictureType.network,
        );
      }
    } else if (_profileImg != null &&
        _profileImg?.type == PeamanPictureType.network) {
      photo = _profileImg!.path;
    }

    updateIsLoading(true);
    final userUpdater = PeamanUserUpdater(
      photo: photo,
      name: _nameController.text.trim(),
      userName: _userNameController.text.trim(),
      country: _selectedCountry,
      searchKeys: _getSearchKeys(),
    );

    if (appUserReadOnly.onboardingStep == _step) {
      userUpdater.onboardingStep = _step + 1;
    }

    await _updateProfile(userUpdater);
    updateIsLoading(false);
    onSuccess?.call();
  }

  // STEP - 1 : update details info step
  void _updateDetailsInfoStep({final Function()? onSuccess}) async {
    if (_dob == null) {
      return logError(message: 'Please provide your birthday');
    }
    if (_gender == PeamanGender.unknown) {
      return logError(message: 'Please provide your gender');
    }
    if (_bioController.text.trim() == '') {
      return logError(message: 'Please enter your bio to continue');
    }

    updateIsLoading(true);
    final userUpdater = PeamanUserUpdater(
      dob: _dob!.millisecondsSinceEpoch,
      gender: _gender,
      bio: _bioController.text.trim(),
    );

    if (appUserReadOnly.onboardingStep == _step) {
      userUpdater.onboardingStep = _step + 1;
    }

    await _updateProfile(userUpdater);
    updateIsLoading(false);

    onSuccess?.call();
  }

  // update profile of current user
  Future _updateProfile(
    final PeamanUserUpdater updater, {
    final Function()? onSuccess,
    final Function()? onError,
  }) async {
    try {
      await PUserProvider.updateUserData(
        uid: appUserReadOnly.uid!,
        updater: updater,
      );
      onSuccess?.call();
    } catch (e) {
      onError?.call();
    }
  }

  // get search keys from name and bio
  List<String> _getSearchKeys() {
    var searchKeys = <String>[];
    final name = _nameController.text.trim();
    final userName = _userNameController.text.trim();
    const bio = '';
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

  // update value of step
  void updateStep(final int newVal) {
    _step = newVal;
    notifyListeners();
  }

  // update value of dob
  void updateDob(final DateTime newVal) {
    _dob = newVal;
    notifyListeners();
  }

  // update value of gender
  void updateGender(final PeamanGender newVal) {
    _gender = newVal;
    notifyListeners();
  }

  // update value of isProfileUpdated
  void updateIsProfileUpdated(final bool newVal) {
    _isProfileUpdated = newVal;
    notifyListeners();
  }

  // update value of profileImgUploadProgress
  void updateProfileImgUploadProgress(final double newVal) {
    _profileImgUploadProgress = newVal;
    notifyListeners();
  }

  // update value of profileImgUploadCompleted
  void updateProfileImgUploadCompleted(final bool newVal) {
    _profileImgUploadCompleted = newVal;
    notifyListeners();
  }
}
