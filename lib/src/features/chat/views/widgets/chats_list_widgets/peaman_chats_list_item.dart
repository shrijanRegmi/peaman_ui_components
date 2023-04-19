import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:timeago/timeago.dart' as timeago;

class PeamanChatsListItem extends ConsumerStatefulWidget {
  final PeamanChat chat;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? avatarBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? titleBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? bodyBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? dateBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? counterBuilder;
  final List<Widget> Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? actionWidgetsBuilder;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    Function(),
  )? onPressed;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    Function(),
  )? onLongPressed;

  const PeamanChatsListItem({
    super.key,
    required this.chat,
    this.avatarBuilder,
    this.titleBuilder,
    this.bodyBuilder,
    this.dateBuilder,
    this.counterBuilder,
    this.actionWidgetsBuilder,
    this.onPressed,
    this.onLongPressed,
  });

  @override
  ConsumerState<PeamanChatsListItem> createState() =>
      _PeamanChatsListItemState();
}

class _PeamanChatsListItemState extends ConsumerState<PeamanChatsListItem> {
  late PeamanChat _chat;

  String get _uid => ref.watch(
        providerOfLoggedInUser.select((value) => value.uid!),
      );

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

      if (oldChat.title != newChat.title) {
        setState(() {
          _chat = _chat.copyWith(
            title: newChat.title,
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

      final oldChatUids = List<String>.from(oldChat.userIds)..sort();
      final newChatUids = List<String>.from(newChat.userIds)..sort();
      if (!listEquals(oldChatUids, newChatUids)) {
        setState(() {
          _chat = _chat.copyWith(
            userIds: newChat.userIds,
          );
        });
      }

      final oldChatActiveUids = List<String>.from(
        oldChat.activeUserIds,
      )..sort();
      final newChatActiveUids = List<String>.from(
        newChat.activeUserIds,
      )..sort();
      if (!listEquals(oldChatActiveUids, newChatActiveUids)) {
        setState(() {
          _chat = _chat.copyWith(
            removedBys: newChat.removedBys,
            addedBys: newChat.addedBys,
          );
        });
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(_chat.activeUserIdsWrapper),
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
        children:
            widget.actionWidgetsBuilder?.call(context, ref, widget.chat) ??
                [
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
          () => widget.onPressed?.call(
            context,
            ref,
            widget.chat,
            () {},
          ),
        )
        .onLongPressed(
          () => widget.onLongPressed?.call(
            context,
            ref,
            widget.chat,
            () {},
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
    final appUserPhoto = ref.watch(
      providerOfLoggedInUser.select((value) => value.photo),
    );
    final avatars = [
      ...users.map((e) => e.photo).toList(),
      if (_chat.type == PeamanChatType.group) appUserPhoto,
    ]..shuffle();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            widget.avatarBuilder?.call(context, ref, widget.chat) ??
                (users.isEmpty || !_chat.activeUserIds.contains(_uid)
                    ? PeamanAvatarBuilder.asset(
                        const PeamanUser().genderStringImage,
                        package: 'peaman_ui_components',
                        size: 45.0,
                        onPressed: () {},
                      )
                    : PeamanAvatarBuilder.multiNetwork(
                        avatars,
                        size: 45.0,
                        onPressed: () {},
                      )),
            SizedBox(
              width: avatars.length >= 3 ? 10.0 : 5.0,
            ),
            widget.titleBuilder?.call(context, ref, widget.chat) ??
                PeamanText.body2(
                  users.isEmpty || !_chat.activeUserIds.contains(_uid)
                      ? 'Unknown Conversation'
                      : _chat.titleExt(users.first.name ?? ''),
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: PeamanColors.grey,
                  ),
                ),
          ],
        ),
        widget.dateBuilder?.call(context, ref, widget.chat) ??
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
    if (_chat.lastMessageId == null) return const SizedBox();

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

    final messageText = _getMessageText(message);

    final unreadCount = _chat.unreadMessages
        .firstWhere(
          (element) => element.uid == uid,
          orElse: PeamanChatUnreadMessage.new,
        )
        .unreadMessagesCount;
    return widget.bodyBuilder?.call(context, ref, widget.chat) ??
        Row(
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
                onPressed: () => widget.onPressed?.call(
                  context,
                  ref,
                  widget.chat,
                  () {},
                ),
                onLinkPressed: (_) => widget.onPressed?.call(
                  context,
                  ref,
                  widget.chat,
                  () {},
                ),
              ),
            ),
            if (message.senderId != uid) _counterBuilder(count: unreadCount),
          ],
        );
  }

  Widget _counterBuilder({
    final int count = 0,
  }) {
    if (count == 0) {
      return const SizedBox();
    }
    return widget.counterBuilder?.call(context, ref, widget.chat) ??
        Padding(
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

  String _getMessageText(final PeamanChatMessage message) {
    final pictures =
        message.files.where((e) => e.type == PeamanFileType.image).toList();
    final videos =
        message.files.where((e) => e.type == PeamanFileType.video).toList();

    var messageText = 'Sent a message';
    final isMyMessage = message.senderId == _uid;

    switch (message.type) {
      case PeamanChatMessageType.info:
        final info = PeamanChatHelper.getInfoMessage(
          message: message.text!,
          infoType: message.infoType,
          usersProvider: (userIds) => ref.watch(
            providerOfPeamanUsersByIdFuture(userIds),
          ),
          uid: _uid,
        );
        messageText = info;
        break;
      case PeamanChatMessageType.text:
        if (message.text != null) {
          messageText = message.text!;
        }
        if (isMyMessage) {
          messageText = 'You: $messageText';
        }
        break;
      case PeamanChatMessageType.file:
        if (pictures.isNotEmpty) {
          messageText = 'Sent an image  📸';
        } else if (videos.isNotEmpty) {
          messageText = 'Sent an video  📸';
        }
        if (isMyMessage) {
          messageText = 'You: $messageText';
        }
        break;
      case PeamanChatMessageType.feedShare:
        messageText = 'Shared a post';
        if (isMyMessage) {
          messageText = 'You: $messageText';
        }
        break;
      default:
    }

    return messageText;
  }
}
