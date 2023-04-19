import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessagesListItem extends ConsumerStatefulWidget {
  final PeamanChatMessage message;
  final PeamanChatMessage? nextMessage;
  final List<String> receiverIds;
  final bool isMessagesSentOnSameHour;
  final bool isFirstMessage;
  final bool isLastMessage;
  final Widget Function(BuildContext, WidgetRef, PeamanChatMessage)?
      sentMessageBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanChatMessage)?
      receivedMessageBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanChatMessage)?
      infoMessageBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? senderInfoBuilder;
  final Widget Function(BuildContext, WidgetRef, List<String>)?
      seenIndicatorBuilder;
  final Widget Function(BuildContext, WidgetRef, List<String>)?
      typingIndicatorBuilder;
  final Function(PeamanChatMessage)? onPressed;
  final Function(PeamanChatMessage)? onLongPressed;
  final Function(PeamanChatMessage)? onSwipped;

  const PeamanChatMessagesListItem({
    Key? key,
    required this.message,
    required this.receiverIds,
    this.nextMessage,
    this.sentMessageBuilder,
    this.receivedMessageBuilder,
    this.infoMessageBuilder,
    this.senderInfoBuilder,
    this.seenIndicatorBuilder,
    this.typingIndicatorBuilder,
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

  PeamanListWrapper<String> get _chatUserIdsWrapper => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.message.chatId!)
            .select((value) =>
                value?.activeUserIdsWrapper ??
                const PeamanListWrapper(values: [])),
      );

  @override
  Widget build(BuildContext context) {
    final isTempMessage = _isTempMessage();
    final showSenderInfo = _showSenderInfo();
    final isReply = _isReply();

    return Column(
      crossAxisAlignment: widget.message.senderId == _uid
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        if (widget.isFirstMessage)
          PeamanDateDivider(
            date: DateTime.fromMillisecondsSinceEpoch(
              widget.message.updatedAt!,
            ),
          ),
        if (isReply) _replyBuilder().pT(10).pB(5),
        PeamanChatMessageSwiper(
          message: widget.message,
          enabled: !isTempMessage &&
              widget.message.type != PeamanChatMessageType.info,
          onSwipped: (message) =>
              widget.onSwipped?.call(message) ??
              ref
                  .read(providerOfPeamanChat.notifier)
                  .setMessageToReply(message),
          child: _messageBuilder(),
        ),
        if (showSenderInfo)
          _senderInfoBuilder().pB(
            widget.nextMessage?.type == PeamanChatMessageType.info ? 0.0 : 10,
          ),
        if (!isTempMessage && widget.isLastMessage)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PeamanChatMessageTypingIndicator(
                chatId: widget.message.chatId!,
              ),
              if (widget.message.senderId == _uid &&
                  widget.message.type != PeamanChatMessageType.info)
                PeamanChatMessageSeenIndicator(
                  chatId: widget.message.chatId!,
                ),
            ],
          ),
        if (isTempMessage)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              PeamanSpinner(
                size: 15.0,
                strokeWidth: 1.0,
              ),
            ],
          ).pR(5.0).pB(10.0).pT(8.0),
      ],
    )
        .pX(10.0)
        .pY(2.5)
        .onPressed(() => widget.onPressed?.call(widget.message))
        .onLongPressed(() => widget.onLongPressed?.call(widget.message));
  }

  Widget _messageBuilder() {
    Widget? thisWidget;

    if (widget.message.senderId == _uid) {
      thisWidget = widget.sentMessageBuilder?.call(
        context,
        ref,
        widget.message,
      );
    } else {
      thisWidget = widget.receivedMessageBuilder?.call(
        context,
        ref,
        widget.message,
      );
    }

    if (thisWidget != null) return thisWidget;

    if (widget.message.type == PeamanChatMessageType.info) {
      return _infoMessageBuilder();
    } else if (widget.message.files.isNotEmpty) {
      return _imageMessageBuilder();
    } else {
      return _textMessageBuilder();
    }
  }

  Widget _replyBuilder() {
    final pictureSize = _getPictureSize();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.message.senderId != _uid)
          Container(
            width: 2.w,
            height: 20.w,
            decoration: BoxDecoration(
              color: PeamanColors.extraLightGrey,
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
        if (widget.message.senderId != _uid)
          SizedBox(
            width: 5.w,
          ),
        Opacity(
          opacity: 0.6,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.message.parentFiles.isNotEmpty ? 3.w : 20.w,
              vertical: widget.message.parentFiles.isNotEmpty ? 0.0 : 10.w,
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
                    readMoreTextStyle: TextStyle(
                      fontSize: 12.0,
                      color: context.theme.colorScheme.primary,
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

  Widget _textMessageBuilder({
    final bool isReply = false,
  }) {
    final isTempMessage = _isTempMessage();

    return Container(
      padding: EdgeInsets.all(15.w),
      constraints: BoxConstraints(
        maxWidth: (ScreenUtil().screenWidth /
                (widget.message.files.isNotEmpty ? 1.3 : 1.5))
            .w,
      ),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.background,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
          bottomLeft: Radius.circular(
            widget.message.senderId == _uid ? 10.0 : 0.0,
          ),
          bottomRight: Radius.circular(
            widget.message.senderId == _uid ? 0.0 : 10.0,
          ),
        ),
      ),
      child: Opacity(
        opacity: isTempMessage || isReply ? 0.6 : 1.0,
        child: PeamanText.body2(
          widget.message.text,
          linkify: true,
        ),
      ),
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

  Widget _infoMessageBuilder() {
    final info = PeamanChatHelper.getInfoMessage(
      message: widget.message.text!,
      infoType: widget.message.infoType,
      usersProvider: (userIds) => ref.watch(
        providerOfPeamanUsersByIdFuture(userIds),
      ),
      uid: _uid,
    );
    if (info.isEmpty) return const SizedBox();

    return Row(
      children: [
        Expanded(
          child: Center(
            child: PeamanText.body1(
              info,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                color: PeamanColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ).pT(25.0).pB(
          widget.nextMessage?.type != PeamanChatMessageType.info ? 25.0 : 0.0,
        );
  }

  Widget _senderInfoBuilder() {
    final senderFuture = ref.watch(
      providerOfSingleUserByIdFuture(widget.message.senderId!),
    );
    final sender = senderFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success,
          (failure) => null,
        );
      },
      orElse: () => null,
    );
    return widget.senderInfoBuilder?.call(context, ref, sender!) ??
        PeamanAvatarBuilder.network(
          sender?.photo,
          opacity: _chatUserIdsWrapper.values.contains(sender?.uid) ? 1.0 : 0.5,
          overlayWidget: _chatUserIdsWrapper.values.contains(sender?.uid)
              ? null
              : Positioned(
                  bottom: 5.h,
                  right: 4.w,
                  child: PeamanRoundIconButton(
                    icon: Icon(
                      Icons.close,
                      color: PeamanColors.white,
                      size: 9.w,
                    ),
                    padding: EdgeInsets.all(1.5.w),
                    bgColor: PeamanColors.red,
                  ),
                ),
          onPressed: () {
            if (widget.message.senderId == _uid) return;

            showPeamanChatUserInfoDialog(
              context: context,
              chatId: widget.message.chatId!,
              user: sender!,
            );
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

  bool _isTempMessage() {
    return widget.message.isTemp;
  }

  bool _isGapBetweenMessagesRequired() {
    if (widget.message.type == PeamanChatMessageType.info) return false;

    return (widget.nextMessage?.senderId != widget.message.senderId ||
        widget.nextMessage?.id == widget.message.id ||
        !widget.isMessagesSentOnSameHour);
  }

  bool _showSenderInfo() {
    if (widget.message.senderId == _uid) {
      return false;
    } else if (widget.message.type == PeamanChatMessageType.info) {
      return false;
    } else if (widget.nextMessage?.type == PeamanChatMessageType.info) {
      return true;
    }
    return _isGapBetweenMessagesRequired();
  }

  bool _isReply() {
    return widget.message.parentId != null && widget.message.parentText != null;
  }
}
