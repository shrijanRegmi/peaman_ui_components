import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_comments_list_item_provider_state.freezed.dart';

@freezed
class PeamanCommentsListItemProviderState
    with _$PeamanCommentsListItemProviderState {
  const factory PeamanCommentsListItemProviderState({
    /// Whether the replies of this comment are visible or not.
    @Default(false) final bool isRepliesVisible,

    /// The state of fetching the comments for the feed.
    @Default(FetchCommentsReplyState.initial())
    final FetchCommentsReplyState fetchCommentsReplyState,

    /// The state of creating a comment.
    @Default(CreateCommentState.initial())
    final CreateCommentState createCommentState,

    /// The state of reacting to the comment.
    @Default(ReactToCommentState.initial())
    final ReactToCommentState reactToCommentState,
  }) = _PeamanCommentsListItemProviderState;
}

@freezed
class FetchCommentsReplyState with _$FetchCommentsReplyState {
  const factory FetchCommentsReplyState.initial() =
      _FetchCommentsReplyStateInitial;
  const factory FetchCommentsReplyState.loading() =
      _FetchCommentsReplyStateLoading;
  const factory FetchCommentsReplyState.success(
    final List<PeamanComment> result,
  ) = _FetchCommentsReplyStateSuccess;
  const factory FetchCommentsReplyState.error(
    final PeamanError error,
  ) = _FetchCommentsReplyStateError;
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
  ) = _CreateCommentStateError;
}

@freezed
class ReactToCommentState with _$ReactToCommentState {
  const factory ReactToCommentState.initial() = _ReactToCommentStateInitial;
  const factory ReactToCommentState.loading() = _ReactToCommentStateLoading;
  const factory ReactToCommentState.success(
    final PeamanReaction result,
  ) = _ReactToCommentStateSuccess;
  const factory ReactToCommentState.error(
    final PeamanError error,
  ) = _ReactToCommentStateError;
}
