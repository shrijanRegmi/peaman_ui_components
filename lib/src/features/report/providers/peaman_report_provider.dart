import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanReport = StateNotifierProvider.autoDispose<
    PeamanReportProvider, PeamanReportProviderState>((ref) {
  return PeamanReportProvider(ref);
});

class PeamanReportProvider extends StateNotifier<PeamanReportProviderState> {
  PeamanReportProvider(
    final Ref ref,
  )   : _ref = ref,
        super(const PeamanReportProviderState());

  final Ref _ref;

  PeamanUser get _appUser => _ref.read(providerOfLoggedInUser);

  PeamanReportRepository get _reportRepository =>
      _ref.watch(providerOfPeamanReportRepository);
  PeamanInfoProvider get _logProvider =>
      _ref.read(providerOfPeamanInfo.notifier);
  PeamanFeedProvider get _feedProvider =>
      _ref.read(providerOfPeamanFeed.notifier);

  Future<void> submitReport({
    required final String id,
    required final PeamanReportType reportType,
    required final String reason,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      submitReportState: const SubmitReportState.loading(),
    );

    final reportedBy = PeamanReportedBy(
      uid: _appUser.uid!,
      reason: reason,
    );

    final result = await _reportRepository.submitReport(
      id: id,
      reportType: reportType,
      reportedBy: reportedBy,
    );

    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          submitReportState: SubmitReportState.success(success),
        );
        if (success.type == PeamanReportType.feed) {
          _feedProvider.hideFeed(feedId: success.id!);
        }
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          submitReportState: SubmitReportState.error(failure),
        );
      },
    );
  }
}
