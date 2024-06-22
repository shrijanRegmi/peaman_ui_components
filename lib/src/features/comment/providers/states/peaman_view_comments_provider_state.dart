import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_view_comments_provider_state.freezed.dart';

@freezed
class PeamanViewCommentsProviderState with _$PeamanViewCommentsProviderState {
  const factory PeamanViewCommentsProviderState({
    /// The state of fetching the comments for the feed.
    @Default(FetchFeedCommentsState.initial())
    final FetchFeedCommentsState fetchFeedCommentsState,

    /// The state of commenting on the feed.
    @Default(PostFeedCommentState.initial())
    final PostFeedCommentState postFeedCommentState,

    /// The state of reply to a comment.
    @Default(PostCommentReplyState.initial())
    final PostCommentReplyState postCommentReplyState,
  }) = _PeamanViewCommentsProviderState;
}

@freezed
class FetchFeedCommentsState with _$FetchFeedCommentsState {
  const factory FetchFeedCommentsState.initial() =
      _FetchFeedCommentsStateInitial;
  const factory FetchFeedCommentsState.loading() =
      _FetchFeedCommentsStateLoading;
  const factory FetchFeedCommentsState.success(
    final List<PeamanComment> result,
  ) = _FetchFeedCommentsStateSuccess;
  const factory FetchFeedCommentsState.error(
    final PeamanError error,
  ) = _FetchFeedCommentsStateError;
}

@freezed
class PostFeedCommentState with _$PostFeedCommentState {
  const factory PostFeedCommentState.initial() = _PostFeedCommentStateInitial;
  const factory PostFeedCommentState.loading() = _PostFeedCommentStateLoading;
  const factory PostFeedCommentState.success(
    final PeamanComment result,
  ) = _PostFeedCommentStateSuccess;
  const factory PostFeedCommentState.error(
    final PeamanError error,
  ) = _PostFeedCommentStateError;
}

@freezed
class PostCommentReplyState with _$PostCommentReplyState {
  const factory PostCommentReplyState.initial() = _PostCommentReplyStateInitial;
  const factory PostCommentReplyState.loading() = _PostCommentReplyStateLoading;
  const factory PostCommentReplyState.success(
    final PeamanComment result,
  ) = _PostCommentReplyStateSuccess;
  const factory PostCommentReplyState.error(
    final PeamanError error,
  ) = _PostCommentReplyStateError;
}
