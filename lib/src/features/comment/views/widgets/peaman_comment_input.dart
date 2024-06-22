import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/comment/providers/peaman_view_comments_provider.dart';

class PeamanCommentInput extends ConsumerStatefulWidget {
  /// Displays a text input field for adding comments to a feed.
  const PeamanCommentInput({
    super.key,
    required this.feedId,
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
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _currentUserImageBuilder(),
            SizedBox(
              width: 10.spMin,
            ),
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
        );
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
      onChanged: (val) => widget.onChanged?.call(val, () {}),
      decoration: const InputDecoration(
        hintText: 'Type your amazing comment...',
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
    );
  }

  /// Handle the posting of the comment.
  void _handlePostComment() {
    // final comment = _commentController.text.trim();
    const comment =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
    if (comment.isEmpty) return;

    ref.read(providerOfPeamanViewComments.notifier).addCommentToState(
          feedId: widget.feedId,
          feedOwnerId: '',
          commentText: comment,
        );
  }
}
