import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanInfo =
    StateNotifierProvider<PeamanInfoProvider, PeamanInfoProviderState>((ref) {
  return PeamanInfoProvider();
});

class PeamanInfoProvider extends StateNotifier<PeamanInfoProviderState> {
  PeamanInfoProvider() : super(const PeamanInfoProviderState());

  void logSuccess(final String success) {
    state = state.copyWith(
      success: success,
    );
  }

  void logWarning(final String warning) {
    state = state.copyWith(
      warning: warning,
    );
  }

  void logError(final String error) {
    state = state.copyWith(
      error: error,
    );
  }

  void removeSuccess() {
    state = state.copyWith(
      success: null,
    );
  }

  void removeWarning() {
    state = state.copyWith(
      warning: null,
    );
  }

  void removeError() {
    state = state.copyWith(
      error: null,
    );
  }
}
