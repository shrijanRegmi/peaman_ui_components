import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/peaman_chat_provider.dart';

class PeamanChatMessagesListItem extends ConsumerStatefulWidget {
  final PeamanChatMessage message;
  final PeamanChatMessage nextMessage;
  final List<PeamanUser> receivers;
  final bool isMessagesSentOnSameHour;
  final bool isFirstMessage;
  final bool isLastMessage;
  final Function(PeamanChatMessage)? onPressed;
  final Function(PeamanChatMessage)? onLongPressed;
  final Function(PeamanChatMessage)? onSwipped;

  const PeamanChatMessagesListItem({
    Key? key,
    required this.message,
    required this.nextMessage,
    required this.receivers,
    this.isMessagesSentOnSameHour = false,
    this.isFirstMessage = false,
    this.isLastMessage = false,
    this.onPressed,
    this.onLongPressed,
    this.onSwipped,
  }) : super(key: key);

  @override
  ConsumerState<PeamanChatMessagesListItem> createState() =>
      _PeamanChatMessagesListItemState();
}

class _PeamanChatMessagesListItemState
    extends ConsumerState<PeamanChatMessagesListItem> {
  PeamanUser get appUser => ref.watch(providerOfLoggedInUser);

  @override
  Widget build(BuildContext context) {
    final isTempMessage = _isTempMessage();
    final isGapRequired = _isGapBetweenMessagesRequired();
    final showSenderInfo = _showSenderInfo();
    final isFriendTyping = _isFriendTyping();
    final hasSeenAllMessages = _hasSeenAllMessages();
    final isReply = _isReply();

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.5,
        horizontal: 20.0,
      ),
      child: GestureDetector(
        onTap: () => widget.onPressed?.call(widget.message),
        onLongPress: () => widget.onLongPressed?.call(widget.message),
        behavior: HitTestBehavior.opaque,
        child: Column(
          crossAxisAlignment: widget.message.senderId == appUser.uid
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            if (widget.isFirstMessage)
              PeamanChatMessagesDivider(
                message: widget.message,
              ),
            if (isReply)
              const SizedBox(
                height: 10.0,
              ),
            if (isReply) _replyBuilder(context),
            if (isReply)
              const SizedBox(
                height: 5.0,
              ),
            PeamanChatMessageSwiper(
              message: widget.message,
              enabled: widget.message.type == PeamanChatMessageType.text,
              onSwipped: widget.onSwipped,
              child: _messageBuilder(context),
            ),
            if (isGapRequired)
              const SizedBox(
                height: 10.0,
              ),
            if (showSenderInfo) _senderInfo(context, appUser),
            if (showSenderInfo)
              const SizedBox(
                height: 20.0,
              ),
            if (!isTempMessage && widget.isLastMessage)
              Row(
                mainAxisAlignment: isFriendTyping
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.end,
                children: [
                  isFriendTyping
                      ? const PeamanChatMessageTypingIndicator()
                      : hasSeenAllMessages
                          ? const PeamanChatMessageSeenIndicator()
                          : const SizedBox(),
                ],
              ),
            if (isTempMessage)
              Padding(
                padding: const EdgeInsets.only(
                  right: 5.0,
                  bottom: 10.0,
                  top: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    PeamanSpinner(
                      size: 15.0,
                      strokeWidth: 1.0,
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _messageBuilder(final BuildContext context) {
    final appUser = ref.watch(providerOfLoggedInUser);

    final isWhiteBgRequired = _isWhiteBgRequired();
    final isGapRequired = _isGapBetweenMessagesRequired();

    return Container(
      padding: EdgeInsets.all(
        isWhiteBgRequired ? 15.0 : 3.0,
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width /
            (widget.message.files.isNotEmpty ? 1.3 : 1.5),
      ),
      decoration: BoxDecoration(
        color: isWhiteBgRequired
            ? context.theme.colorScheme.background
            : PeamanColors.transparent,
        borderRadius: isGapRequired
            ? BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
                bottomLeft: Radius.circular(
                  widget.message.senderId == appUser.uid ? 10.0 : 0.0,
                ),
                bottomRight: Radius.circular(
                  widget.message.senderId == appUser.uid ? 0.0 : 10.0,
                ),
              )
            : const BorderRadius.all(Radius.circular(10.0)),
      ),
      // TODO(shrijanRegmi)
      // child: message.extraId != null
      //     ? _feedShareMessageBuilder(context, appUser)
      //     : message.files.isEmpty
      //         ? _textMessageBuilder()
      //         : _imageMessageBuilder(appUser, context),
      child: widget.message.files.isEmpty
          ? _textMessageBuilder()
          : _imageMessageBuilder(appUser, context),
    );
  }

  Widget _replyBuilder(final BuildContext context) {
    final appUser = ref.watch(providerOfLoggedInUser);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.message.senderId != appUser.uid)
          Container(
            width: 2.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: PeamanColors.extraLightGrey,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        if (widget.message.senderId != appUser.uid)
          const SizedBox(
            width: 5.0,
          ),
        Opacity(
          opacity: 0.6,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width /
                  (widget.message.files.isNotEmpty ? 1.3 : 1.5),
            ),
            decoration: BoxDecoration(
              color: context.theme.brightness == Brightness.dark
                  ? PeamanColors.extraLightGrey
                  : PeamanColors.white,
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            child: PeamanText.body2(
              widget.message.parentText!.replaceAll("\n", " "),
              limit: 100,
              withReadMore: true,
              readMoreText: 'Read',
              style: const TextStyle(
                fontSize: 14.0,
              ),
              readMoreTextStyle: const TextStyle(
                fontSize: 12.0,
                color: PeamanColors.secondaryDark,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        if (widget.message.senderId == appUser.uid)
          const SizedBox(
            width: 5.0,
          ),
        if (widget.message.senderId == appUser.uid)
          Container(
            width: 2.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: PeamanColors.extraLightGrey,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
      ],
    );
  }

  Widget _textMessageBuilder({final bool isReply = false}) {
    final isTempMessage = _isTempMessage();

    return Opacity(
      opacity: isTempMessage || isReply ? 0.6 : 1.0,
      child: PeamanText.body2(widget.message.text),
    );
  }

  Widget _imageMessageBuilder(
    final PeamanUser appUser,
    final BuildContext context,
  ) {
    final isTempMessage = _isTempMessage();
    final pictureSize = _getPictureSize();
    final pictures = widget.message.files
        .where((element) => element.type == PeamanFileType.image)
        .toList();

    return Opacity(
      opacity: isTempMessage ? 0.6 : 1.0,
      child: Wrap(
        runSpacing: 5.0,
        spacing: 5.0,
        alignment: appUser.uid == widget.message.senderId
            ? WrapAlignment.end
            : WrapAlignment.start,
        children: [
          for (final picture in pictures)
            GestureDetector(
              onTap: () {
                if (isTempMessage) return;

                context.pushNamed(
                  PeamanViewPicturesScreen.route,
                  arguments: PeamanViewPicturesArgs(
                    pictures: pictures.map((e) => e.url!).toList(),
                    activeIndex: widget.message.files.indexOf(picture),
                  ),
                );
              },
              child: Hero(
                tag: picture.url!,
                child: Container(
                  height: pictureSize,
                  width: pictureSize - 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: PeamanColors.extraLightGrey.withOpacity(0.5),
                    image: DecorationImage(
                      image: isTempMessage
                          ? FileImage(File(picture.url!)) as ImageProvider
                          : CachedNetworkImageProvider(picture.url!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _senderInfo(
    final BuildContext context,
    final PeamanUser appUser,
  ) {
    return PeamanAvatarBuilder.network(
      widget.message.senderId == appUser.uid
          ? appUser.photo
          : widget.receivers
              .firstWhere((element) => element.uid == widget.message.senderId)
              .photo,
      onPressed: () {
        // TODO(shrijanRegmi)
        // if (message.senderId == appUser.uid) return;

        // Navigator.pushNamed(
        //   context,
        //   AppRoutes.friendProfileScreen,
        //   arguments: FriendProfileScreenArgs.byFriendId(
        //     friendId: receivers.uid,
        //   ),
        // );
      },
    );
  }

  // get the sizes of the pictures according to the number of pictures
  double _getPictureSize() {
    final pictures = widget.message.files.length;

    if (pictures == 1) {
      return 220.0;
    } else if (pictures == 2) {
      return 150.0;
    } else if (pictures > 13) {
      return 80.0;
    } else {
      return 100.0;
    }
  }

  // condition that defines if white background is required for a message
  bool _isWhiteBgRequired() {
    return widget.message.extraId == null && widget.message.files.isEmpty;
  }

  // condition that defines if the message is temporary or not
  bool _isTempMessage() {
    return widget.message.isTemp;
  }

  // condition that defines if the gap is required between two messages
  bool _isGapBetweenMessagesRequired() {
    return (widget.nextMessage.senderId != widget.message.senderId ||
        widget.nextMessage.id == widget.message.id ||
        !widget.isMessagesSentOnSameHour);
  }

  // condition that defines if the sender information (like picture)
  bool _showSenderInfo() {
    return _isGapBetweenMessagesRequired() &&
        widget.message.senderId != appUser.uid;
  }

  // condition that defines if the other user is typing or not
  bool _isFriendTyping() {
    final chat = ref.watch(
      providerOfSinglePeamanChatFromChatsStream(
        widget.message.chatId!,
      ),
    );
    if (chat == null) return false;

    return chat.typingUserIds.contains(widget.receivers.first.uid);
  }

  // condition that defines if the user has seen all the messages or not
  bool _hasSeenAllMessages() {
    return false;
    // TODO(shrijanRegmi)
    // final chat = ref.watch(
    //   providerOfSinglePeamanChatFromChatsStream(widget.message.chatId!),
    // );

    // if (chat == null) {
    //   return false;
    // } else {
    //   return chat.unreadMessages
    //               .firstWhere(
    //                 (element) => element.uid == widget.receivers.uid,
    //                 orElse: () => PeamanUnreadMessage(),
    //               )
    //               .unreadMessagesCount ==
    //           0 &&
    //       widget.message.senderId == appUser.uid;
    // }
  }

  // condition that defines if the message is the reply of another message
  bool _isReply() {
    return widget.message.parentId != null && widget.message.parentText != null;
  }
}
