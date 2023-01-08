import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:timeago/timeago.dart' as timeago;

class PeamanChatsListItem extends StatefulWidget {
  final PeamanChat chat;
  final Function(PeamanChat, PeamanUser)? onPressed;
  final Function(PeamanChat, PeamanUser)? onLongPressedChat;

  const PeamanChatsListItem({
    super.key,
    required this.chat,
    this.onPressed,
    this.onLongPressedChat,
  });

  @override
  State<PeamanChatsListItem> createState() => _PeamanChatsListItemState();
}

class _PeamanChatsListItemState extends State<PeamanChatsListItem> {
  late Stream<PeamanUser> _userStream;
  late Stream<PeamanMessage> _lastMessageStream;

  @override
  void initState() {
    super.initState();
    final appUser = context.pread<PeamanUser>();
    final friendId = widget.chat.userIds.firstWhere(
      (element) => appUser.uid != element,
      orElse: () => '',
    );

    _userStream = PUserProvider.getUserByIdStream(uid: friendId);
    _lastMessageStream = PChatProvider.getSingleMessageByIdStream(
      chatId: widget.chat.id!,
      messageId: widget.chat.lastMessageId!,
    );
  }

  @override
  void didUpdateWidget(covariant PeamanChatsListItem oldWidget) {
    if (widget.chat.userIds != oldWidget.chat.userIds) {
      final appUser = context.pread<PeamanUser>();
      final friendId = widget.chat.userIds.firstWhere(
        (element) => appUser.uid != element,
        orElse: () => '',
      );

      _userStream = PUserProvider.getUserByIdStream(uid: friendId);
    }

    if (widget.chat.lastMessageId != oldWidget.chat.lastMessageId) {
      _lastMessageStream = PChatProvider.getSingleMessageByIdStream(
        chatId: widget.chat.id!,
        messageId: widget.chat.lastMessageId!,
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return PeamanUserFetcher.singleStream(
      userStream: _userStream,
      singleBuilder: (user) {
        return GestureDetector(
          onTap: () => widget.onPressed?.call(widget.chat, user),
          onLongPress: () => widget.onLongPressedChat?.call(widget.chat, user),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerBuilder(user),
                const SizedBox(
                  height: 10.0,
                ),
                _bodyBuilder(),
                const SizedBox(
                  height: 18.0,
                ),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _headerBuilder(final PeamanUser user) {
    final appUser = context.pread<PeamanUser>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            PeamanAvatarBuilder.network(
              // CommonHelper.isUserInfoHidden(context, user: user)
              //     ? null
              //     : user.photo,
              user.photo,
              size: 45.0,
              onPressed: () {
                if (user.uid == appUser.uid) return;

                // Navigator.pushNamed(
                //   context,
                //   AppRoutes.friendProfileScreen,
                //   arguments: FriendProfileScreenArgs.byFriend(
                //     friend: user,
                //   ),
                // );
              },
            ),
            const SizedBox(
              width: 5.0,
            ),
            PeamanText.body2(
              // CommonHelper.isUserInfoHidden(context, user: user)
              //     ? 'App User'
              //     : user.name,
              user.name,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: PeamanColors.grey,
              ),
            ),
          ],
        ),
        PeamanText.body2(
          timeago.format(
            DateTime.fromMillisecondsSinceEpoch(
              widget.chat.updatedAt!,
            ),
          ),
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: PeamanColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _bodyBuilder() {
    final appUser = context.pread<PeamanUser>();

    return StreamBuilder<PeamanMessage>(
      stream: _lastMessageStream,
      builder: (context, snap) {
        if (snap.hasData && snap.data != null) {
          final message = snap.data!;
          final pictures = message.files
              .where((e) => e.type == PeamanFileType.image)
              .toList();
          final videos = message.files
              .where((e) => e.type == PeamanFileType.video)
              .toList();
          final text = message.type == PeamanMessageType.text
              ? message.text
              : message.type == PeamanMessageType.file
                  ? pictures.isNotEmpty
                      ? 'Sent an image  📸'
                      : videos.isNotEmpty
                          ? 'Sent an video  📸'
                          : 'Sent a message'
                  : message.type == PeamanMessageType.feedShare
                      ? 'Shared a post'
                      : 'Sent a message';

          final messageText =
              message.senderId == appUser.uid ? 'You: $text' : text;
          final unreadCount = widget.chat.unreadMessages
              .firstWhere(
                (element) => element.uid == appUser.uid,
                orElse: () => PeamanUnreadMessage(),
              )
              .unreadMessagesCount;
          return Row(
            children: [
              Expanded(
                child: PeamanText.heading6(
                  messageText,
                  limit: 65,
                  style: TextStyle(
                    fontFamily: GoogleFonts.raleway().fontFamily,
                    height: 1.5,
                    fontWeight:
                        unreadCount == 0 ? FontWeight.normal : FontWeight.bold,
                  ),
                ),
              ),
              if (message.senderId != appUser.uid)
                _countBuilder(count: unreadCount),
            ],
          );
        }

        return Container();
      },
    );
  }

  Widget _countBuilder({
    final int count = 0,
  }) {
    if (count == 0) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: PeamanColors.primary,
        ),
        child: Text(
          count > 9 ? '9+' : '$count',
          style: const TextStyle(
            fontSize: 10.0,
            color: PeamanColors.white,
          ),
        ),
      ),
    );
  }
}
