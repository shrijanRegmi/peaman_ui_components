import 'dart:math';

import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/comment/providers/states/view_comments_provider_state.dart';
import 'package:peaman_ui_components/src/features/comment/views/view_comments_screen.dart';

/// Provider of [ViewCommentsProvider].
final providerOfViewComments = StateNotifierProvider.autoDispose<
    ViewCommentsProvider, ViewCommentsProviderState>(
  (ref) => ViewCommentsProvider(
    ref: ref,
    state: const ViewCommentsProviderState(),
  ),
);

class ViewCommentsProvider extends StateNotifier<ViewCommentsProviderState> {
  /// Handles the business logic for the [ViewCommentsScreen] like fetching comments, posting comments etc.
  ViewCommentsProvider({
    required final Ref ref,
    required final ViewCommentsProviderState state,
  })  : _ref = ref,
        super(state);

  final Ref _ref;
  PeamanFeedRepository get _feedRepository =>
      _ref.read(providerOfPeamanFeedRepository);
  PeamanUser get _loggedInUser => _ref.read(providerOfLoggedInUser);

  /// Fetches the comments for the feed.
  ///
  /// The [feedId] is the id of the feed for which the comments are to be fetched.
  Future<void> fetchFeedComments({
    required final String feedId,
  }) async {
    state = state.copyWith(
      fetchFeedCommentsState: const FetchFeedCommentsState.loading(),
    );

    final result = await _feedRepository.getComments(
      feedId: feedId,
      parent: PeamanCommentParent.feed,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          fetchFeedCommentsState: FetchFeedCommentsState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          fetchFeedCommentsState: FetchFeedCommentsState.error(error),
        );
      },
    );
  }

  /// Posts a comment for the feed.
  ///
  /// The [feedId] is the id of the feed for which the comment is to be posted.
  ///
  /// The [feedOwnerId] is the id of the owner of the feed.
  ///
  /// The [comment] is the comment to be posted.
  Future<void> postFeedComment({
    required final String feedId,
    required final String feedOwnerId,
    required final String comment,
  }) async {
    final rand = Random();
    final randomInt = rand.nextInt(1000);

    final comment = PeamanComment(
      feedId: feedId,
      ownerId: _loggedInUser.uid,
      parentId: feedId,
      parentOwnerId: feedOwnerId,
      parent: PeamanCommentParent.feed,
      comment: 'Hello World $randomInt',
    );

    state = state.copyWith(
      postFeedCommentState: const PostFeedCommentState.loading(),
    );

    final result = await _feedRepository.createComment(
      comment: comment,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          postFeedCommentState: PostFeedCommentState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          postFeedCommentState: PostFeedCommentState.error(error),
        );
      },
    );
  }

  /// Posts a comment for another comment. (i.e Reply).
  ///
  /// The [feedId] is the id of the feed for which the comment is to be posted.
  ///
  /// The [commentId] is the id of the comment for which the reply is to be posted.
  ///
  /// The [commentOwnerId] is the id of the owner of the comment.
  ///
  /// The [comment] is the comment to be posted.
  Future<void> postCommentReply({
    required final String feedId,
    required final String commentId,
    required final String commentOwnerId,
    required final String comment,
  }) async {
    final rand = Random();
    final randomInt = rand.nextInt(1000);

    final comment = PeamanComment(
      feedId: feedId,
      ownerId: _loggedInUser.uid,
      parentId: commentId,
      parentOwnerId: commentOwnerId,
      parent: PeamanCommentParent.comment,
      comment: 'Hello World $randomInt',
    );

    state = state.copyWith(
      postCommentReplyState: const PostCommentReplyState.loading(),
    );

    final result = await _feedRepository.createComment(
      comment: comment,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          postCommentReplyState: PostCommentReplyState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          postCommentReplyState: PostCommentReplyState.error(error),
        );
      },
    );
  }
}
