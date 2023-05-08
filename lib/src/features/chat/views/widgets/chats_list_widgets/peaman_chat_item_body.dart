import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatItemBody extends ConsumerStatefulWidget {
  const PeamanChatItemBody({
    super.key,
    required this.chat,
    required this.users,
    this.messageTextLimit = 65,
    this.messageTextBuilder,
    this.counterBuilder,
    this.onPressedMessageText,
  });

  final PeamanChat chat;
  final List<PeamanUser> users;

  final int messageTextLimit;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
  )? messageTextBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
  )? counterBuilder;

  final Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
  )? onPressedMessageText;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanChatItemBodyState();
}

class _PeamanChatItemBodyState extends ConsumerState<PeamanChatItemBody> {
  @override
  Widget build(BuildContext context) {
    if (widget.chat.lastMessageId == null) return const SizedBox();

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
    final uid = ref.watch(
      providerOfLoggedInUser.select((value) => value.uid),
    );

    final messageText = _getMessageText(message);

    final unreadCount = widget.chat.unreadMessages
        .firstWhere(
          (element) => element.uid == uid,
          orElse: PeamanChatUnreadMessage.new,
        )
        .unreadMessagesCount;
    return Row(
      children: [
        Expanded(
          child: widget.messageTextBuilder?.call(
                context,
                ref,
                widget.chat,
                widget.users,
              ) ??
              PeamanText.heading6(
                messageText,
                limit: widget.messageTextLimit,
                style: TextStyle(
                  fontFamily: GoogleFonts.raleway().fontFamily,
                  height: 1.5,
                  fontStyle: message.type == PeamanChatMessageType.info
                      ? FontStyle.italic
                      : FontStyle.normal,
                  fontWeight:
                      unreadCount == 0 ? FontWeight.normal : FontWeight.bold,
                ),
                onPressed: () => widget.onPressedMessageText?.call(
                  context,
                  ref,
                  widget.chat,
                  widget.users,
                ),
                onLinkPressed: (_) => widget.onPressedMessageText?.call(
                  context,
                  ref,
                  widget.chat,
                  widget.users,
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
    return widget.counterBuilder?.call(
          context,
          ref,
          widget.chat,
          widget.users,
        ) ??
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
    final uid = ref.watch(
      providerOfLoggedInUser.select((value) => value.uid!),
    );

    final pictures =
        message.files.where((e) => e.type == PeamanFileType.image).toList();
    final videos =
        message.files.where((e) => e.type == PeamanFileType.video).toList();

    var messageText = 'Sent a message';
    final isMyMessage = message.senderId == uid;

    switch (message.type) {
      case PeamanChatMessageType.info:
        final info = PeamanChatHelper.getInfoMessage(
          message: message.text!,
          infoType: message.infoType,
          usersProvider: (userIds) => ref.watch(
            providerOfPeamanUsersByIdFuture(userIds),
          ),
          uid: uid,
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

  Widget _errorBuilder(final String message) {
    return Center(
      child: PeamanText.subtitle1(message),
    );
  }

  Widget _loadingBuilder() {
    return const SizedBox();
  }
}
