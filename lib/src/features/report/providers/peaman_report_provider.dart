import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanReport = StateNotifierProvider.autoDispose<
    PeamanReportProvider, PeamanReportProviderState>((ref) {
  return PeamanReportProvider();
});

class PeamanReportProvider extends StateNotifier<PeamanReportProviderState> {
  PeamanReportProvider() : super(const PeamanReportProviderState());

  Future<void> submitReport({
    required final String reason,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      submitReportState: const SubmitReportState.loading(),
    );

    state = state.copyWith(
      submitReportState: const SubmitReportState.success(true),
    );
  }
}
