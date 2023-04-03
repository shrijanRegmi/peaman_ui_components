import 'package:freezed_annotation/freezed_annotation.dart';

part 'peaman_info_provider_state.freezed.dart';

@freezed
class PeamanInfoProviderState with _$PeamanInfoProviderState {
  const factory PeamanInfoProviderState({
    final String? error,
    final String? success,
    final String? warning,
  }) = _PeamanInfoProviderState;
}
