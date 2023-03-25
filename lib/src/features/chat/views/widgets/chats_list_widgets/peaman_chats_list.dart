import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/peaman_chat_provider.dart';

class PeamanChatsList extends ConsumerStatefulWidget {
  final List<PeamanChat>? chats;
  final ScrollController? controller;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget Function(BuildContext, int)? itemBuilder;
  final Widget Function(BuildContext, List<PeamanChat>)? listBuilder;
  final Function(PeamanChat, Function())? onPressedChat;
  final Function(PeamanChat, Function())? onLongPressedChat;

  const PeamanChatsList({
    super.key,
    this.chats,
    this.controller,
    this.loadingWidget,
    this.emptyWidget,
    this.itemBuilder,
    this.listBuilder,
    this.onPressedChat,
    this.onLongPressedChat,
  });

  @override
  ConsumerState<PeamanChatsList> createState() => _PeamanChatsListState();
}

class _PeamanChatsListState extends ConsumerState<PeamanChatsList> {
  @override
  Widget build(BuildContext context) {
    if (widget.chats != null) {
      if (widget.chats!.isEmpty) return _emptyBuilder();
      return _dataBuilder(context, widget.chats!);
    }

    final chatsStream = ref.watch(providerOfPeamanUserChatsStream);
    return chatsStream.when(
      data: (data) {
        if (data.isEmpty) return _emptyBuilder();
        return _dataBuilder(context, data);
      },
      error: (e, _) => _errorBuilder(e.toString()),
      loading: () => _loadingBuilder(),
    );
  }

  Widget _dataBuilder(
    final BuildContext context,
    final List<PeamanChat> chats,
  ) {
    return widget.listBuilder?.call(context, chats) ??
        ListView.builder(
          itemCount: chats.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: widget.itemBuilder ??
              (context, index) {
                final chat = chats[index];
                final chatItemWidget = PeamanChatsListItem(
                  chat: chat,
                  onPressed: (chat) =>
                      widget.onPressedChat?.call(
                        chat,
                        () => _gotoChatConvoScreen(context, chat),
                      ) ??
                      _gotoChatConvoScreen(context, chat),
                  onLongPressed: (chat) =>
                      widget.onLongPressedChat?.call(chat, () {}),
                );

                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: chatItemWidget,
                  );
                }

                return chatItemWidget;
              },
        );
  }

  Widget _emptyBuilder() {
    return widget.emptyWidget ??
        const PeamanEmptyBuilder(
          title: "No chats found!",
          subTitle:
              "You haven't started conversation with anyone. Try searching people and start connecting.",
        );
  }

  Widget _loadingBuilder() {
    return widget.loadingWidget ?? const PeamanSpinner();
  }

  Widget _errorBuilder(final String message) {
    return Center(
      child: PeamanText.subtitle1(message),
    );
  }

  void _gotoChatConvoScreen(
    final BuildContext context,
    final PeamanChat chat,
  ) {
    final appUser = ref.watch(providerOfLoggedInUser);
    context.pushNamed(
      PeamanChatConversationScreen.route,
      arguments: PeamanChatConversationArgs(
        chatId: chat.id!,
        chatType: chat.type,
        receiverIds: chat.userIds.where((e) => e != appUser.uid).toList(),
      ),
    );
  }
}
