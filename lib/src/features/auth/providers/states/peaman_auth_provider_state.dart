import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'peaman_auth_provider_state.freezed.dart';

@freezed
class PeamanAuthProviderState with _$PeamanAuthProviderState {
  const factory PeamanAuthProviderState({
    @Default(false) final bool isLoading,
    required final TextEditingController emailController,
    required final TextEditingController passwordController,
    required final TextEditingController confirmPasswordController,
  }) = _PeamanAuthProviderState;
}
