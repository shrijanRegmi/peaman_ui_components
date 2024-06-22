import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/comment/providers/peaman_view_comments_provider.dart';

class PeamanCommentInput extends ConsumerStatefulWidget {
  /// Displays a text input field for adding comments to a feed.
  const PeamanCommentInput({
    super.key,
    required this.feedId,
    required this.feedOwnerId,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.onPressedSend,
  });

  /// The focus node for the text input field.
  final FocusNode? focusNode;

  /// The controller for the text input field.
  final TextEditingController? controller;

  /// The callback that is called when the text in the input field changes.
  final Function(String, Function())? onChanged;

  /// The callback that is called when the send button is pressed.
  final Function(Function())? onPressedSend;

  /// The id of the feed for which the comments are to be added.
  final String feedId;

  /// The id of the owner of the feed.
  final String feedOwnerId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanCommentInputState();
}

class _PeamanCommentInputState extends ConsumerState<PeamanCommentInput> {
  late TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.spMin,
        vertical: 10.spMin,
      ),
      decoration: BoxDecoration(
        color: context.theme.inputDecorationTheme.fillColor,
        boxShadow: [
          BoxShadow(
            color:
                context.theme.appBarTheme.shadowColor ?? PeamanColors.lightGrey,
            offset: const Offset(0, -2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _currentUserImageBuilder(),
            Expanded(
              child: _messageInputBuilder(),
            ),
            SizedBox(
              width: 5.spMin,
            ),
            _sendBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _currentUserImageBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final photo = ref.watch(
          providerOfLoggedInUser.select(
            (value) => value.photo,
          ),
        );

        return PeamanAvatarBuilder.network(
          photo,
          size: 30.0,
          onPressed: _handlePostComment,
        ).pB(5.0);
      },
    );
  }

  Widget _messageInputBuilder() {
    return TextFormField(
      minLines: 1,
      maxLines: 5,
      focusNode: widget.focusNode,
      controller: widget.controller ?? _commentController,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      textCapitalization: TextCapitalization.sentences,
      textAlignVertical: TextAlignVertical.center,
      onChanged: (val) => widget.onChanged?.call(val, () {}),
      decoration: const InputDecoration(
        hintText: 'Type your amazing comment...',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        border: InputBorder.none,
      ),
    );
  }

  Widget _sendBuilder() {
    return GestureDetector(
      onTap: () =>
          widget.onPressedSend?.call(
            _handlePostComment,
          ) ??
          _handlePostComment(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.inputDecorationTheme.suffixIconColor,
        ),
        child: SvgPicture.asset(
          'assets/svgs/outlined_send_message.svg',
          color: context.isDarkMode ? PeamanColors.white70 : PeamanColors.white,
          width: 14.w,
          package: 'peaman_ui_components',
        ),
      ),
    ).pB(5.0);
  }

  /// Handle the posting of the comment.
  void _handlePostComment() {
    final comment = _commentController.text.trim();
    if (comment.isEmpty) return;

    _commentController.clear();

    ref.read(providerOfPeamanViewComments.notifier).addCommentToState(
          feedId: widget.feedId,
          feedOwnerId: widget.feedOwnerId,
          commentText: comment,
        );
  }
}
