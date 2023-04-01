import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_onboarding_provider_state.freezed.dart';

@freezed
class PeamanOnboardingProviderState with _$PeamanOnboardingProviderState {
  const factory PeamanOnboardingProviderState({
    @Default(0) final int onboardingStep,
    required final TextEditingController nameController,
    required final TextEditingController usernameController,
    required final TextEditingController bioController,
    final PeamanFileUrlExtended? selectedProfilePicture,
    final String? selectedCountry,
    final DateTime? selectedDateOfBirth,
    @Default(PeamanGender.unknown) final PeamanGender selectedGender,
    @Default(0.0) final double profilePictureUploadProgress,
    @Default(true) final bool isProfilePictureUploaded,
    @Default(UpdateOnboardingInfoState.initial())
        final UpdateOnboardingInfoState updateOnboardingInfoState,
  }) = _PeamanOnboardingProviderState;
}

@freezed
class UpdateOnboardingInfoState with _$UpdateOnboardingInfoState {
  const factory UpdateOnboardingInfoState.initial() =
      UpdateOnboardingInfoStateInitial;
  const factory UpdateOnboardingInfoState.loading() =
      UpdateOnboardingInfoStateLoading;
  const factory UpdateOnboardingInfoState.success(
    final bool result,
  ) = UpdateOnboardingInfoStateSuccess;
  const factory UpdateOnboardingInfoState.error(
    final PeamanError error,
  ) = UpdateOnboardingInfoStateError;
}
