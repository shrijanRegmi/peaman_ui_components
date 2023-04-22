import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_feed_provider_state.freezed.dart';

@freezed
class PeamanFeedProviderState with _$PeamanFeedProviderState {
  const factory PeamanFeedProviderState({
    @Default(<PeamanFeed>[]) final List<PeamanFeed> timelineFeeds,
    @Default(CreateFeedState.initial()) final CreateFeedState createFeedState,
    @Default(UpdateFeedState.initial()) final UpdateFeedState updateFeedState,
    @Default(DeleteFeedState.initial()) final DeleteFeedState deleteFeedState,
  }) = _PeamanFeedProviderState;
}

@freezed
class CreateFeedState with _$CreateFeedState {
  const factory CreateFeedState.initial() = _CreateFeedStateInitial;
  const factory CreateFeedState.loading() = _CreateFeedStateLoading;
  const factory CreateFeedState.success(
    final PeamanFeed result,
  ) = _CreateFeedStateSuccess;
  const factory CreateFeedState.error(
    final PeamanError error,
  ) = _CreateFeedStateFailure;
}

@freezed
class UpdateFeedState with _$UpdateFeedState {
  const factory UpdateFeedState.initial() = _UpdateFeedStateInitial;
  const factory UpdateFeedState.loading() = _UpdateFeedStateLoading;
  const factory UpdateFeedState.success(
    final bool result,
  ) = _UpdateFeedStateSuccess;
  const factory UpdateFeedState.error(
    final PeamanError error,
  ) = _UpdateFeedStateFailure;
}

@freezed
class DeleteFeedState with _$DeleteFeedState {
  const factory DeleteFeedState.initial() = _DeleteFeedStateInitial;
  const factory DeleteFeedState.loading() = _DeleteFeedStateLoading;
  const factory DeleteFeedState.success(
    final bool result,
  ) = _DeleteFeedStateSuccess;
  const factory DeleteFeedState.error(
    final PeamanError error,
  ) = _DeleteFeedStateFailure;
}
