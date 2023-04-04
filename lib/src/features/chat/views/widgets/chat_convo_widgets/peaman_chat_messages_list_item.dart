import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessagesListItem extends ConsumerStatefulWidget {
  final PeamanChatMessage message;
  final PeamanChatMessage nextMessage;
  final List<String> receiverIds;
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
    required this.receiverIds,
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
  Provider<PeamanUser> get _appUserProvider => providerOfLoggedInUser;
  String get _uid => ref.watch(_appUserProvider.select((value) => value.uid!));

  @override
  Widget build(BuildContext context) {
    final isTempMessage = _isTempMessage();
    final isGapRequired = _isGapBetweenMessagesRequired();
    final showSenderInfo = _showSenderInfo();
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
          crossAxisAlignment: widget.message.senderId == _uid
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
            if (isReply) _replyBuilder(),
            if (isReply && widget.message.parentFiles.isEmpty)
              const SizedBox(
                height: 5.0,
              ),
            PeamanChatMessageSwiper(
              message: widget.message,
              enabled: !widget.message.isTemp,
              onSwipped: (message) =>
                  widget.onSwipped?.call(message) ??
                  ref
                      .read(providerOfPeamanChat.notifier)
                      .setMessageToReply(message),
              child: _messageBuilder(),
            ),
            if (isGapRequired)
              const SizedBox(
                height: 10.0,
              ),
            if (showSenderInfo) _senderInfo(),
            if (showSenderInfo)
              const SizedBox(
                height: 20.0,
              ),
            if (!isTempMessage && widget.isLastMessage)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PeamanChatMessageTypingIndicator(
                    chatId: widget.message.chatId!,
                  ),
                  if (widget.message.senderId == _uid)
                    PeamanChatMessageSeenIndicator(
                      chatId: widget.message.chatId!,
                    ),
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

  Widget _messageBuilder() {
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
                  widget.message.senderId == _uid ? 10.0 : 0.0,
                ),
                bottomRight: Radius.circular(
                  widget.message.senderId == _uid ? 0.0 : 10.0,
                ),
              )
            : const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: widget.message.files.isEmpty
          ? _textMessageBuilder()
          : _imageMessageBuilder(),
    );
  }

  Widget _replyBuilder() {
    final pictureSize = _getPictureSize();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.message.senderId != _uid)
          Container(
            width: 2.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: PeamanColors.extraLightGrey,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        if (widget.message.senderId != _uid)
          const SizedBox(
            width: 5.0,
          ),
        Opacity(
          opacity: 0.6,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.message.parentFiles.isNotEmpty ? 3.w : 20.w,
              vertical: 10.w,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width /
                  (widget.message.parentFiles.isNotEmpty ? 1.3 : 1.5),
            ),
            decoration: widget.message.parentFiles.isNotEmpty
                ? null
                : BoxDecoration(
                    color: context.theme.brightness == Brightness.dark
                        ? PeamanColors.extraLightGrey
                        : PeamanColors.white,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
            child: widget.message.parentFiles.isEmpty
                ? PeamanText.body2(
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
                  )
                : Wrap(
                    runSpacing: 5,
                    spacing: 5,
                    alignment: widget.message.senderId == _uid
                        ? WrapAlignment.end
                        : WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      for (final picture in widget.message.parentFiles)
                        Hero(
                          tag: picture.url!,
                          child: Container(
                            height: pictureSize.h,
                            width: (pictureSize - 20.0).w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.shade200,
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(picture.url!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                          ),
                        ),
                    ],
                  ),
          ),
        ),
        if (widget.message.senderId == _uid)
          const SizedBox(
            width: 5.0,
          ),
        if (widget.message.senderId == _uid)
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

  Widget _imageMessageBuilder() {
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
        alignment: _uid == widget.message.senderId
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

  Widget _senderInfo() {
    final senderFuture = ref.watch(
      providerOfSingleUserByIdFuture(widget.message.senderId!),
    );
    return PeamanAvatarBuilder.network(
      senderFuture.maybeWhen(
        data: (data) {
          return data.when(
            (success) => success.photo,
            (failure) => null,
          );
        },
        orElse: () => null,
      ),
      onPressed: () {
        // TODO(shrijanRegmi)
        // if (message.senderId == _uid) return;

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

  bool _isWhiteBgRequired() {
    return widget.message.extraId == null && widget.message.files.isEmpty;
  }

  bool _isTempMessage() {
    return widget.message.isTemp;
  }

  bool _isGapBetweenMessagesRequired() {
    return (widget.nextMessage.senderId != widget.message.senderId ||
        widget.nextMessage.id == widget.message.id ||
        !widget.isMessagesSentOnSameHour);
  }

  bool _showSenderInfo() {
    return _isGapBetweenMessagesRequired() && widget.message.senderId != _uid;
  }

  bool _isReply() {
    return widget.message.parentId != null && widget.message.parentText != null;
  }
}
