import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_feed_provider_state.freezed.dart';

@freezed
class PeamanFeedProviderState with _$PeamanFeedProviderState {
  const factory PeamanFeedProviderState({
    @Default(<PeamanFeed>[]) final List<PeamanFeed> timelineFeeds,
    @Default(<PeamanFeed>[]) final List<PeamanFeed> profileFeeds,
    @Default(CreateFeedState.initial()) final CreateFeedState createFeedState,
    @Default(UpdateFeedState.initial()) final UpdateFeedState updateFeedState,
    @Default(DeleteFeedState.initial()) final DeleteFeedState deleteFeedState,
    @Default(HideFeedState.initial()) final HideFeedState hideFeedState,
    @Default(ShowFeedState.initial()) final ShowFeedState showFeedState,
    @Default(SaveFeedState.initial()) final SaveFeedState saveFeedState,
    @Default(UnsaveFeedState.initial()) final UnsaveFeedState unsaveFeedState,
    @Default(ShareFeedState.initial()) final ShareFeedState shareFeedState,
    @Default(SetFeedVisibilityState.initial())
        final SetFeedVisibilityState setFeedVisibilityState,
    @Default(CreateReactionState.initial())
        final CreateReactionState createReactionState,
    @Default(DeleteReactionState.initial())
        final DeleteReactionState deleteReactionState,
    @Default(CreateCommentState.initial())
        final CreateCommentState createCommentState,
    @Default(UpdateCommentState.initial())
        final UpdateCommentState updateCommentState,
    @Default(DeleteCommentState.initial())
        final DeleteCommentState deleteCommentState,
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

@freezed
class HideFeedState with _$HideFeedState {
  const factory HideFeedState.initial() = _HideFeedStateInitial;
  const factory HideFeedState.loading() = _HideFeedStateLoading;
  const factory HideFeedState.success(
    final bool result,
  ) = _HideFeedStateSuccess;
  const factory HideFeedState.error(
    final PeamanError error,
  ) = _HideFeedStateFailure;
}

@freezed
class ShowFeedState with _$ShowFeedState {
  const factory ShowFeedState.initial() = _ShowFeedStateInitial;
  const factory ShowFeedState.loading() = _ShowFeedStateLoading;
  const factory ShowFeedState.success(
    final bool result,
  ) = _ShowFeedStateSuccess;
  const factory ShowFeedState.error(
    final PeamanError error,
  ) = _ShowFeedStateFailure;
}

@freezed
class SaveFeedState with _$SaveFeedState {
  const factory SaveFeedState.initial() = _SaveFeedStateInitial;
  const factory SaveFeedState.loading() = _SaveFeedStateLoading;
  const factory SaveFeedState.success(
    final bool result,
  ) = _SaveFeedStateSuccess;
  const factory SaveFeedState.error(
    final PeamanError error,
  ) = _SaveFeedStateFailure;
}

@freezed
class UnsaveFeedState with _$UnsaveFeedState {
  const factory UnsaveFeedState.initial() = _UnsaveFeedStateInitial;
  const factory UnsaveFeedState.loading() = _UnsaveFeedStateLoading;
  const factory UnsaveFeedState.success(
    final bool result,
  ) = _UnsaveFeedStateSuccess;
  const factory UnsaveFeedState.error(
    final PeamanError error,
  ) = _UnsaveFeedStateFailure;
}

@freezed
class ShareFeedState with _$ShareFeedState {
  const factory ShareFeedState.initial() = _ShareFeedStateInitial;
  const factory ShareFeedState.loading() = _ShareFeedStateLoading;
  const factory ShareFeedState.success(
    final bool result,
  ) = _ShareFeedStateSuccess;
  const factory ShareFeedState.error(
    final PeamanError error,
  ) = _ShareFeedStateFailure;
}

@freezed
class SetFeedVisibilityState with _$SetFeedVisibilityState {
  const factory SetFeedVisibilityState.initial() =
      _SetFeedVisibilityStateInitial;
  const factory SetFeedVisibilityState.loading() =
      _SetFeedVisibilityStateLoading;
  const factory SetFeedVisibilityState.success(
    final bool result,
  ) = _SetFeedVisibilityStateSuccess;
  const factory SetFeedVisibilityState.error(
    final PeamanError error,
  ) = _SetFeedVisibilityStateFailure;
}

@freezed
class CreateReactionState with _$CreateReactionState {
  const factory CreateReactionState.initial() = _CreateReactionStateInitial;
  const factory CreateReactionState.loading() = _CreateReactionStateLoading;
  const factory CreateReactionState.success(
    final PeamanReaction result,
  ) = _CreateReactionStateSuccess;
  const factory CreateReactionState.error(
    final PeamanError error,
  ) = _CreateReactionStateFailure;
}

@freezed
class DeleteReactionState with _$DeleteReactionState {
  const factory DeleteReactionState.initial() = _DeleteReactionStateInitial;
  const factory DeleteReactionState.loading() = _DeleteReactionStateLoading;
  const factory DeleteReactionState.success(
    final bool result,
  ) = _DeleteReactionStateSuccess;
  const factory DeleteReactionState.error(
    final PeamanError error,
  ) = _DeleteReactionStateFailure;
}

@freezed
class CreateCommentState with _$CreateCommentState {
  const factory CreateCommentState.initial() = _CreateCommentStateInitial;
  const factory CreateCommentState.loading() = _CreateCommentStateLoading;
  const factory CreateCommentState.success(
    final PeamanComment result,
  ) = _CreateCommentStateSuccess;
  const factory CreateCommentState.error(
    final PeamanError error,
  ) = _CreateCommentStateFailure;
}

@freezed
class UpdateCommentState with _$UpdateCommentState {
  const factory UpdateCommentState.initial() = _UpdateCommentStateInitial;
  const factory UpdateCommentState.loading() = _UpdateCommentStateLoading;
  const factory UpdateCommentState.success(
    final bool result,
  ) = _UpdateCommentStateSuccess;
  const factory UpdateCommentState.error(
    final PeamanError error,
  ) = _UpdateCommentStateFailure;
}

@freezed
class DeleteCommentState with _$DeleteCommentState {
  const factory DeleteCommentState.initial() = _DeleteCommentStateInitial;
  const factory DeleteCommentState.loading() = _DeleteCommentStateLoading;
  const factory DeleteCommentState.success(
    final bool result,
  ) = _DeleteCommentStateSuccess;
  const factory DeleteCommentState.error(
    final PeamanError error,
  ) = _DeleteCommentStateFailure;
}
