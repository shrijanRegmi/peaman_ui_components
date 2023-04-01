import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanError =
    StateNotifierProvider<PeamanErrorProvider, PeamanError?>((ref) {
  return PeamanErrorProvider();
});

class PeamanErrorProvider extends StateNotifier<PeamanError?> {
  PeamanErrorProvider() : super(null);

  void logError(final PeamanError error) {
    state = error;
  }

  void removeError() {
    state = null;
  }
}
