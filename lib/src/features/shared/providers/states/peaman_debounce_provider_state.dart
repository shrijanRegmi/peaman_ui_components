import 'package:freezed_annotation/freezed_annotation.dart';

part 'peaman_debounce_provider_state.freezed.dart';

@freezed
class PeamanDebounceProviderState with _$PeamanDebounceProviderState {
  const factory PeamanDebounceProviderState.initial() =
      _PeamanDebounceProviderStateInitial;
  const factory PeamanDebounceProviderState.loading() =
      _PeamanDebounceProviderStateLoading;
  const factory PeamanDebounceProviderState.success() =
      _PeamanDebounceProviderStateSuccess;
  const factory PeamanDebounceProviderState.error() =
      _PeamanDebounceProviderStateError;
}
