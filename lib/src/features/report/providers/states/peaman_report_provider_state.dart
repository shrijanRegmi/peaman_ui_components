import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_report_provider_state.freezed.dart';

@freezed
class PeamanReportProviderState with _$PeamanReportProviderState {
  const factory PeamanReportProviderState({
    @Default(SubmitReportState.initial())
        final SubmitReportState submitReportState,
  }) = _PeamanReportProviderState;
}

@freezed
class SubmitReportState with _$SubmitReportState {
  const factory SubmitReportState.initial() = _SubmitReportStateInitial;
  const factory SubmitReportState.loading() = _SubmitReportStateLoading;
  const factory SubmitReportState.success(
    final bool result,
  ) = _SubmitReportStateSuccess;
  const factory SubmitReportState.error(
    final PeamanError error,
  ) = _SubmitReportStateError;
}
