import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
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
  late PeamanChat _chat;

  @override
  void initState() {
    super.initState();
    _chat = widget.chat;
  }

  @override
  void didUpdateWidget(covariant PeamanChatsListItem oldWidget) {
    final oldChat = oldWidget.chat;
    final newChat = widget.chat;

    final uid = ref.read(
      providerOfLoggedInUser.select((value) => value.uid),
    );

    if (oldChat != newChat) {
      if (oldChat.id != newChat.id) {
        setState(() {
          _chat = _chat.copyWith(
            id: newChat.id,
          );
        });
      }

      if (oldChat.updatedAt != newChat.updatedAt) {
        setState(() {
          _chat = _chat.copyWith(
            updatedAt: newChat.updatedAt,
          );
        });
      }

      if (oldChat.type != newChat.type) {
        setState(() {
          _chat = _chat.copyWith(
            type: newChat.type,
          );
        });
      }

      if (oldChat.lastMessageId != newChat.lastMessageId) {
        setState(() {
          _chat = _chat.copyWith(
            lastMessageId: newChat.lastMessageId,
          );
        });
      }

      if (oldChat.lastMessageCreatedAt != newChat.lastMessageCreatedAt) {
        setState(() {
          _chat = _chat.copyWith(
            lastMessageCreatedAt: newChat.lastMessageCreatedAt,
          );
        });
      }

      if (oldChat.unreadMessages != newChat.unreadMessages) {
        final oldUnreadMessagesCount = oldChat.unreadMessages
            .firstWhere(
              (element) => element.uid == uid,
              orElse: PeamanChatUnreadMessage.new,
            )
            .unreadMessagesCount;
        final newUnreadMessagesCount = newChat.unreadMessages
            .firstWhere(
              (element) => element.uid == uid,
              orElse: PeamanChatUnreadMessage.new,
            )
            .unreadMessagesCount;

        if (oldUnreadMessagesCount != newUnreadMessagesCount) {
          setState(() {
            _chat = _chat.copyWith(
              unreadMessages: newChat.unreadMessages,
            );
          });
        }
      }

      if (!listEquals(oldChat.userIds, newChat.userIds)) {
        setState(() {
          _chat = _chat.copyWith(
            userIds: newChat.userIds,
          );
        });
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(_chat.userIds),
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
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.5,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PeamanChatArchiveButton(
                    chatId: _chat.id!,
                  ),
                ),
                Expanded(
                  child: PeamanChatDeleteButton(
                    chatId: _chat.id!,
                  ),
                ),
              ],
            ).pL(10),
          ),
        ],
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
            height: 20.0,
          ),
          const Divider(
            height: 0.0,
          ),
        ],
      ),
    )
        .pX(20)
        .pY(10)
        .onPressed(
          () => widget.onPressed?.call(widget.chat),
        )
        .onLongPressed(
          () => widget.onLongPressed?.call(widget.chat),
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
    final appUserPhoto = ref.watch(
      providerOfLoggedInUser.select((value) => value.photo),
    );
    final remaining = _chat.userIds.length - 2;
    final avatars = [
      ...users.map((e) => e.photo).toList(),
      if (_chat.type == PeamanChatType.group) appUserPhoto,
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
                  ? 'Unknown'
                  : remaining == 0
                      ? _chat.type == PeamanChatType.group
                          ? 'You and ${users.first.name}'
                          : '${users.first.name}'
                      : 'You, ${users.first.name} and $remaining ${remaining > 1 ? 'others' : 'other'}',
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
              _chat.updatedAt!,
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
        chatId: _chat.id!,
        messageId: _chat.lastMessageId!,
      ),
    ));

    return lastMessageStream.when(
      data: (data) => _lastMessageData(data),
      error: (e, _) => _errorBuilder(e.toString()),
      loading: () => _loadingBuilder(),
    );
  }

  Widget _lastMessageData(final PeamanChatMessage message) {
    final uid = ref.watch(
      providerOfLoggedInUser.select((value) => value.uid),
    );
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

    final messageText = message.senderId == uid ? 'You: $text' : text;
    final unreadCount = _chat.unreadMessages
        .firstWhere(
          (element) => element.uid == uid,
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
        if (message.senderId != uid) _countBuilder(count: unreadCount),
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
