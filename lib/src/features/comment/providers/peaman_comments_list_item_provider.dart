import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/comment/providers/states/peaman_comments_list_item_provider_state.dart';

/// Provider of [PeamanCommentsListItemProvider].
final providerOfPeamanCommentsListItemProvider = StateNotifierProvider.family<
    PeamanCommentsListItemProvider,
    PeamanCommentsListItemProviderState,
    String>(
  (ref, commentId) => PeamanCommentsListItemProvider(
    ref: ref,
    state: const PeamanCommentsListItemProviderState(),
  ),
);

class PeamanCommentsListItemProvider
    extends StateNotifier<PeamanCommentsListItemProviderState> {
  /// Handles the state management for the comments list item.
  PeamanCommentsListItemProvider({
    required final Ref ref,
    required final PeamanCommentsListItemProviderState state,
  })  : _ref = ref,
        super(state);

  final Ref _ref;
  PeamanFeedRepository get _feedRepository =>
      _ref.read(providerOfPeamanFeedRepository);
  PeamanUser get _loggedInUser => _ref.read(providerOfLoggedInUser);

  /// Toggles the visibility of the replies.
  void toggleRepliesVisibility() {
    state = state.copyWith(
      isRepliesVisible: !state.isRepliesVisible,
    );
  }

  /// Fetches the replies for the comment.
  ///
  /// The [feedId] is the id of the feed for which the comments are to be fetched.
  Future<void> fetchCommentReplies({
    required final String feedId,
    required final String commentId,
  }) async {
    state = state.copyWith(
      fetchCommentsReplyState: const FetchCommentsReplyState.loading(),
    );

    final result = await _feedRepository.getCommentsByParentId(
      feedId: feedId,
      parentId: commentId,
      parent: PeamanCommentParent.comment,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          fetchCommentsReplyState: FetchCommentsReplyState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          fetchCommentsReplyState: FetchCommentsReplyState.error(error),
        );
      },
    );
  }

  /// Reacts to the comment.
  ///
  /// The [feedId] is the id of the feed for which the comment is to be reacted.
  ///
  /// The [commentId] is the id of the comment for which the reaction is to be created.
  ///
  /// The [commentOwnerId] is the id of the owner of the comment.
  Future<void> reactToComment({
    required final String feedId,
    required final String commentId,
    required final String commentOwnerId,
  }) async {
    final reaction = PeamanReaction(
      feedId: feedId,
      ownerId: _loggedInUser.uid,
      parent: PeamanReactionParent.comment,
      parentId: commentId,
      parentOwnerId: commentOwnerId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    state = state.copyWith(
      reactToCommentState: const ReactToCommentState.loading(),
    );

    final result = await _feedRepository.createReaction(
      reaction: reaction,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          reactToCommentState: ReactToCommentState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          reactToCommentState: ReactToCommentState.error(error),
        );
      },
    );
  }
}
