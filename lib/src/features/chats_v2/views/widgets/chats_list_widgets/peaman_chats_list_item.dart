import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chats_v2/views/widgets/chats_list_widgets/peaman_chat_item_header.dart';

import 'peaman_chat_item_body.dart';

enum _Type {
  byChat,
  byChatId,
  byChatProvider,
}

typedef _ChatProvider = AsyncValue<PeamanChat>;

class PeamanChatsListItem extends ConsumerStatefulWidget {
  const PeamanChatsListItem.byChat({
    super.key,
    required this.chat,
    this.padding,
    this.builder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byChat,
        chatId = '',
        chatProvider = null;

  const PeamanChatsListItem.byChatId({
    super.key,
    required this.chatId,
    this.padding,
    this.builder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byChatId,
        chat = const PeamanChat(),
        chatProvider = null;

  const PeamanChatsListItem.byChatProvider({
    super.key,
    required this.chatProvider,
    this.padding,
    this.builder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byChatProvider,
        chat = const PeamanChat(),
        chatId = '',
        assert(
          chatProvider != null,
          'chatProvider cannot be null',
        );

  final _Type type;

  final PeamanChat chat;
  final String chatId;
  final _ChatProvider Function(
    BuildContext,
    WidgetRef,
  )? chatProvider;

  final EdgeInsets? padding;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? builder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? headerBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? bodyBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? actionsBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanChatsListItemState();
}

class _PeamanChatsListItemState extends ConsumerState<PeamanChatsListItem> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case _Type.byChat:
        return _byChatTypeBuilder();
      case _Type.byChatId:
        return _byChatIdTypeBuilder();
      case _Type.byChatProvider:
        return _byChatProviderTypeBuilder();
      default:
        return const SizedBox();
    }
  }

  Widget _byChatTypeBuilder() {
    return _chatBuilder(widget.chat);
  }

  Widget _byChatIdTypeBuilder() {
    final chatFuture = ref.watch(
      providerOfPeamanSingleChatByIdStream(widget.chatId),
    );
    return chatFuture.when(
      data: _chatBuilder,
      error: (e, _) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }

  Widget _byChatProviderTypeBuilder() {
    final chatFuture = widget.chatProvider?.call(context, ref);
    return chatFuture!.when(
      data: _chatBuilder,
      error: (e, _) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }

  Widget _chatBuilder(final PeamanChat chat) {
    if (chat.id.isNull) return const SizedBox();

    return Padding(
      padding: widget.padding ??
          EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 15.h,
          ),
      child: widget.builder?.call(context, ref, chat) ??
          Column(
            children: [
              PeamanChatItemHeader(chat: chat),
              PeamanChatItemBody(chat: chat),
            ],
          ),
    );
  }
}
