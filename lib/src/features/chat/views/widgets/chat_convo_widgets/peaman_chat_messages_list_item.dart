import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessagesListItem extends StatelessWidget {
  final PeamanMessage message;
  final PeamanMessage nextMessage;
  final PeamanUser friend;
  final bool isMessagesSentOnSameHour;
  final bool isFirstMessage;
  final bool isLastMessage;
  final Function(PeamanMessage)? onPressed;
  final Function(PeamanMessage)? onLongPressed;
  final Function(PeamanMessage)? onSwipped;

  const PeamanChatMessagesListItem({
    Key? key,
    required this.message,
    required this.nextMessage,
    required this.friend,
    this.isMessagesSentOnSameHour = false,
    this.isFirstMessage = false,
    this.isLastMessage = false,
    this.onPressed,
    this.onLongPressed,
    this.onSwipped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appUser = context.pwatch<PeamanUser>();

    final isTempMessage = _isTempMessage();
    final isGapRequired = _isGapBetweenMessagesRequired();
    final showSenderInfo = _showSenderInfo(context);
    final isFriendTyping = _isFriendTyping(context);
    final hasSeenAllMessages = _hasSeenAllMessages(context);
    final isReply = _isReply(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.5,
        horizontal: 20.0,
      ),
      child: GestureDetector(
        onTap: () => onPressed?.call(message),
        onLongPress: () => onLongPressed?.call(message),
        behavior: HitTestBehavior.opaque,
        child: Column(
          crossAxisAlignment: message.senderId == appUser.uid
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            if (isFirstMessage)
              PeamanChatMessagesDivider(
                message: message,
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
              message: message,
              enabled: message.type == PeamanMessageType.text,
              onSwipped: onSwipped,
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
            if (!isTempMessage && isLastMessage)
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
    final appUser = context.pwatch<PeamanUser>();

    final isWhiteBgRequired = _isWhiteBgRequired();
    final isGapRequired = _isGapBetweenMessagesRequired();

    return Container(
      padding: EdgeInsets.all(
        isWhiteBgRequired ? 15.0 : 3.0,
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width /
            (message.files.isNotEmpty ? 1.3 : 1.5),
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
                  message.senderId == appUser.uid ? 10.0 : 0.0,
                ),
                bottomRight: Radius.circular(
                  message.senderId == appUser.uid ? 0.0 : 10.0,
                ),
              )
            : const BorderRadius.all(Radius.circular(10.0)),
      ),
      // child: message.extraId != null
      //     ? _feedShareMessageBuilder(context, appUser)
      //     : message.files.isEmpty
      //         ? _textMessageBuilder()
      //         : _imageMessageBuilder(appUser, context),
      child: message.files.isEmpty
          ? _textMessageBuilder()
          : _imageMessageBuilder(appUser, context),
    );
  }

  Widget _replyBuilder(final BuildContext context) {
    final appUser = context.pwatch<PeamanUser>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (message.senderId != appUser.uid)
          Container(
            width: 2.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: PeamanColors.extraLightGrey,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        if (message.senderId != appUser.uid)
          const SizedBox(
            width: 5.0,
          ),
        Opacity(
          opacity: 0.6,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width /
                  (message.files.isNotEmpty ? 1.3 : 1.5),
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
              message.parentText!.replaceAll("\n", " "),
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
        if (message.senderId == appUser.uid)
          const SizedBox(
            width: 5.0,
          ),
        if (message.senderId == appUser.uid)
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
      child: PeamanText.body2(message.text),
    );
  }

  Widget _imageMessageBuilder(
    final PeamanUser appUser,
    final BuildContext context,
  ) {
    final isTempMessage = _isTempMessage();
    final pictureSize = _getPictureSize();
    final pictures = message.files
        .where((element) => element.type == PeamanFileType.image)
        .toList();

    return Opacity(
      opacity: isTempMessage ? 0.6 : 1.0,
      child: Wrap(
        runSpacing: 5.0,
        spacing: 5.0,
        alignment: appUser.uid == message.senderId
            ? WrapAlignment.end
            : WrapAlignment.start,
        children: [
          for (final picture in pictures)
            GestureDetector(
              onTap: () {
                if (isTempMessage) return;

                context.navigateNamed(
                  PeamanRoutes.viewPicturesScreen,
                  arguments: PeamanViewPicturesArgs(
                    pictures: pictures.map((e) => e.url!).toList(),
                    activeIndex: message.files.indexOf(picture),
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

  // Widget _feedShareMessageBuilder(
  //   final BuildContext context,
  //   final PeamanUser appUser,
  // ) {
  //   final isSentByMe = appUser.uid == message.senderId;

  //   final sharedAPostWidget = Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 5.0),
  //     child: Text(
  //       '${isSentByMe ? 'You' : 'They'} shared a post to ${isSentByMe ? 'them' : 'you'}',
  //       style: const TextStyle(
  //         color: PeamanColors.grey,
  //         fontSize: 12.0,
  //       ),
  //     ),
  //   );

  //   final crossAxisAlignment =
  //       isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

  //   return Column(
  //     crossAxisAlignment: crossAxisAlignment,
  //     children: [
  //       const SizedBox(
  //         height: 10.0,
  //       ),
  //       if (message.extraId != null)
  //         FeedFetcher.singleFuture(
  //           feedFuture: PFeedProvider.getSingleFeedById(
  //             feedId: message.extraId!,
  //           ),
  //           loadingWidget: Container(
  //             height: 300.0,
  //             decoration: BoxDecoration(
  //               color: kcExtraLightGrey,
  //               borderRadius: BorderRadius.circular(20.0),
  //               border: Border.all(color: kcSecondaryDark),
  //             ),
  //           ),
  //           singleBuilder: (feed) {
  //             final feedType = feed.type;
  //             final pictures = feed.files
  //                 .where((e) => e.type == PeamanFileType.image)
  //                 .toList();
  //             String? imgUrl;

  //             if (feedType == PeamanFeedType.other) {
  //               final videoId = feed.ytLink?.contains('youtu.be/') == true
  //                   ? feed.ytLink?.split('.be/').last
  //                   : feed.ytLink?.split('v=').last;
  //               imgUrl = 'https://img.youtube.com/vi/$videoId/0.jpg';
  //             } else if (pictures.isNotEmpty) {
  //               imgUrl = pictures.first.url;
  //             }

  //             return Column(
  //               crossAxisAlignment: crossAxisAlignment,
  //               children: [
  //                 GestureDetector(
  //                   behavior: HitTestBehavior.opaque,
  //                   onTap: () {
  //                     if (feed.id == null) return;

  //                     Navigator.pushNamed(
  //                       context,
  //                       AppRoutes.viewSingleFeedScreen,
  //                       arguments: ViewSingleFeedArgs.byFeedId(
  //                         feedId: feed.id,
  //                       ),
  //                     );
  //                   },
  //                   child: Container(
  //                     height: 300.0,
  //                     decoration: BoxDecoration(
  //                       color: kcExtraLightGrey,
  //                       borderRadius: BorderRadius.circular(20.0),
  //                       border: Border.all(color: kcSecondaryDark),
  //                       image: imgUrl == null
  //                           ? null
  //                           : DecorationImage(
  //                               image: CachedNetworkImageProvider(imgUrl),
  //                               fit: BoxFit.cover,
  //                             ),
  //                     ),
  //                     child: feed.id == null
  //                         ? const FeedDeleted()
  //                         : Column(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             crossAxisAlignment: CrossAxisAlignment.end,
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.all(10.0),
  //                                 child: Icon(
  //                                   feedType == PeamanFeedType.file &&
  //                                           pictures.length > 1
  //                                       ? Icons.style
  //                                       : feedType == PeamanFeedType.file &&
  //                                               pictures.length == 1
  //                                           ? Icons.insert_photo_rounded
  //                                           : Icons.play_arrow_rounded,
  //                                   color: kcWhite,
  //                                 ),
  //                               ),
  //                               Container(
  //                                 height: 50.0,
  //                                 decoration: const BoxDecoration(
  //                                   color: kcWhite,
  //                                   borderRadius: BorderRadius.only(
  //                                     bottomLeft: Radius.circular(20.0),
  //                                     bottomRight: Radius.circular(20.0),
  //                                   ),
  //                                 ),
  //                                 child: const Center(
  //                                   child: Text(
  //                                     'View Post',
  //                                     style: TextStyle(
  //                                       color: kcSecondaryDark,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                   ),
  //                 ),
  //                 sharedAPostWidget,
  //               ],
  //             );
  //           },
  //         ),
  //     ],
  //   );
  // }

  Widget _senderInfo(
    final BuildContext context,
    final PeamanUser appUser,
  ) {
    return PeamanAvatarBuilder.network(
      message.senderId == appUser.uid ? appUser.photo : friend.photo,
      onPressed: () {
        // if (message.senderId == appUser.uid) return;

        // Navigator.pushNamed(
        //   context,
        //   AppRoutes.friendProfileScreen,
        //   arguments: FriendProfileScreenArgs.byFriendId(
        //     friendId: friend.uid,
        //   ),
        // );
      },
    );
  }

  // get the sizes of the pictures according to the number of pictures
  double _getPictureSize() {
    final pictures = message.files.length;

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
    return message.extraId == null && message.files.isEmpty;
  }

  // condition that defines if the message is temporary or not
  bool _isTempMessage() {
    return message.extraData['is_temp'] ?? false;
  }

  // condition that defines if the gap is required between two messages
  bool _isGapBetweenMessagesRequired() {
    return (nextMessage.senderId != message.senderId ||
        nextMessage.id == message.id ||
        !isMessagesSentOnSameHour);
  }

  // condition that defines if the sender information (like picture)
  // should be shown or not
  bool _showSenderInfo(final BuildContext context) {
    final appUser = context.pwatch<PeamanUser>();
    return _isGapBetweenMessagesRequired() && message.senderId != appUser.uid;
  }

  // condition that defines if the other user is typing or not
  bool _isFriendTyping(final BuildContext context) {
    final chats = context.pwatch<List<PeamanChat>>();
    final chat = chats.firstWhere(
      (element) => element.id == message.chatId,
      orElse: () => PeamanChat(),
    );

    return chat.typingUserIds.contains(friend.uid);
  }

  // condition that defines if the user has seen all the messages or not
  bool _hasSeenAllMessages(final BuildContext context) {
    final appUser = context.pwatch<PeamanUser>();
    final chats = context.pwatch<List<PeamanChat>>();

    final chat = chats.firstWhere(
      (element) => element.id == message.chatId,
      orElse: () => PeamanChat(),
    );

    return chat.unreadMessages
                .firstWhere(
                  (element) => element.uid == friend.uid,
                  orElse: () => PeamanUnreadMessage(),
                )
                .unreadMessagesCount ==
            0 &&
        message.senderId == appUser.uid;
  }

  // condition that defines if the message is the reply of another message
  bool _isReply(final BuildContext context) {
    return message.parentId != null && message.parentText != null;
  }
}
