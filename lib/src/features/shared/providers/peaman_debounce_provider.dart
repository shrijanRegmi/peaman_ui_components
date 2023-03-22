import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/src/features/shared/providers/states/peaman_debounce_provider_state.dart';

final providerOfPeamanDebounce = StateNotifierProvider.autoDispose<
    PeamanDebounceProvider, PeamanDebounceProviderState>((ref) {
  return PeamanDebounceProvider();
});

class PeamanDebounceProvider
    extends StateNotifier<PeamanDebounceProviderState> {
  PeamanDebounceProvider()
      : super(
          const PeamanDebounceProviderState.initial(),
        );

  Timer? _timer;

  void createDebounce() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
      state = const PeamanDebounceProviderState.initial();
    } else {
      state = const PeamanDebounceProviderState.loading();
      _timer = Timer(
        const Duration(milliseconds: 800),
        () {
          state = const PeamanDebounceProviderState.success();
        },
      );
    }
  }
}
