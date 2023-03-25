import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/args/peaman_single_peaman_chat_message_stream_args.dart';
import 'package:peaman_ui_components/src/features/chat/providers/peaman_chat_provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class PeamanChatsListItem extends ConsumerStatefulWidget {
  final PeamanChat chat;
  final Function(PeamanChat)? onPressed;
  final Function(PeamanChat)? onLongPressed;

  const PeamanChatsListItem({
    super.key,
    required this.chat,
    this.onPressed,
    this.onLongPressed,
  });

  @override
  ConsumerState<PeamanChatsListItem> createState() =>
      _PeamanChatsListItemState();
}

class _PeamanChatsListItemState extends ConsumerState<PeamanChatsListItem> {
  @override
  Widget build(BuildContext context) {
    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(widget.chat.userIds),
    );
    return usersFuture.when(
      data: (data) {
        return data.when(
          (success) => _usersDataBuilder(success),
          (failure) => _errorBuilder(failure.message),
        );
      },
      error: (e, _) => _errorBuilder(e.toString()),
      loading: () => _loadingBuilder(),
    );
  }

  Widget _usersDataBuilder(final List<PeamanUser> users) {
    // TODO(shrijanRegmi): fix for multiple users
    return GestureDetector(
      onTap: () => widget.onPressed?.call(widget.chat),
      onLongPress: () => widget.onLongPressed?.call(widget.chat),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerBuilder(users),
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
  }

  Widget _errorBuilder(final String message) {
    return Center(
      child: PeamanText.subtitle1(message),
    );
  }

  Widget _loadingBuilder() {
    return const SizedBox();
  }

  Widget _headerBuilder(final List<PeamanUser> users) {
    final appUser = ref.watch(providerOfLoggedInUser);
    final remaining = widget.chat.userIds.length - 2;
    final avatars = [
      ...users.map((e) => e.photo).toList(),
      if (widget.chat.type == PeamanChatType.group) appUser.photo,
    ]..shuffle();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            PeamanAvatarBuilder.multiNetwork(
              // TODO(shrijanRegmi)
              // CommonHelper.isUserInfoHidden(context, user: user)
              //     ? null
              //     : user.photo,
              avatars,
              size: 45.0,
              onPressed: () {
                // TODO(shrijanRegmi)
                // if (user.uid == appUser.uid) return;
                // Navigator.pushNamed(
                //   context,
                //   AppRoutes.friendProfileScreen,
                //   arguments: FriendProfileScreenArgs.byFriend(
                //     friend: user,
                //   ),
                // );
              },
            ),
            SizedBox(
              width: avatars.length >= 3 ? 10.0 : 5.0,
            ),
            PeamanText.body2(
              // TODO(shrijanRegmi)
              // CommonHelper.isUserInfoHidden(context, user: user)
              //     ? 'App User'
              //     : user.name,
              users.isEmpty
                  ? 'Group Chat'
                  : remaining == 0
                      ? '${users.first.name}'
                      : '${users.first.name} and $remaining ${remaining > 1 ? 'others' : 'other'}',
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
    final lastMessageStream = ref.watch(providerOfSinglePeamanChatMessageStream(
      PeamanSingleChatMessageArgs(
        chatId: widget.chat.id!,
        messageId: widget.chat.lastMessageId!,
      ),
    ));

    return lastMessageStream.when(
      data: (data) => _lastMessageData(data),
      error: (e, _) => _errorBuilder(e.toString()),
      loading: () => _loadingBuilder(),
    );
  }

  Widget _lastMessageData(final PeamanChatMessage message) {
    final appUser = ref.watch(providerOfLoggedInUser);
    final pictures =
        message.files.where((e) => e.type == PeamanFileType.image).toList();
    final videos =
        message.files.where((e) => e.type == PeamanFileType.video).toList();
    final text = message.type == PeamanChatMessageType.text
        ? message.text
        : message.type == PeamanChatMessageType.file
            ? pictures.isNotEmpty
                ? 'Sent an image  📸'
                : videos.isNotEmpty
                    ? 'Sent an video  📸'
                    : 'Sent a message'
            : message.type == PeamanChatMessageType.feedShare
                ? 'Shared a post'
                : 'Sent a message';

    final messageText = message.senderId == appUser.uid ? 'You: $text' : text;
    final unreadCount = widget.chat.unreadMessages
        .firstWhere(
          (element) => element.uid == appUser.uid,
          orElse: PeamanChatUnreadMessage.new,
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
        if (message.senderId != appUser.uid) _countBuilder(count: unreadCount),
      ],
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
