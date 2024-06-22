import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/comment/providers/peaman_view_comments_provider.dart';
import 'package:peaman_ui_components/src/features/comment/views/widgets/peaman_comment_input.dart';
import 'package:peaman_ui_components/src/features/comment/views/widgets/peaman_comments_list.dart';

class PeamanViewCommentsScreenArgs {
  final String feedId;
  final String feedOwnerId;

  const PeamanViewCommentsScreenArgs({
    required this.feedId,
    required this.feedOwnerId,
  });
}

class PeamanViewCommentsScreen extends ConsumerStatefulWidget {
  /// Displays the list of comments for a feed.
  const PeamanViewCommentsScreen({
    super.key,
    required this.feedId,
    required this.feedOwnerId,
  });

  /// The id of the feed for which the comments are to be displayed.
  final String feedId;

  /// The id of the owner of the feed.
  final String feedOwnerId;

  static const route = '/peaman_view_comments';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanViewCommentsScreenState();
}

class _PeamanViewCommentsScreenState
    extends ConsumerState<PeamanViewCommentsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onInit());
  }

  @override
  Widget build(BuildContext context) {
    // register this provider to the lifecycle of this widget
    ref.watch(providerOfPeamanViewComments.select((value) => null));

    return Scaffold(
      appBar: PeamanAppbar(
        title: PeamanText.heading4(
          'Comments',
          style: GoogleFonts.caveat(),
        ),
      ),
      body: PeamanCommentsList.comment(
        feedId: widget.feedId,
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: PeamanCommentInput(
          feedId: widget.feedId,
          feedOwnerId: widget.feedOwnerId,
        ),
      ),
    ).keyboardDismisser(context);
  }

  void _onInit() {
    ref
        .read(providerOfPeamanViewComments.notifier)
        .fetchFeedComments(feedId: widget.feedId);
  }
}
