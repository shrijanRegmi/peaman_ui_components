import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/peaman_chat_provider.dart';

class PeamanChatsList extends ConsumerWidget {
  final List<PeamanChat>? chats;
  final ScrollController? controller;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget Function(BuildContext, int)? itemBuilder;
  final Widget Function(BuildContext, List<PeamanChat>)? listBuilder;
  final Function(PeamanChat, PeamanUser, Function())? onPressedChat;
  final Function(PeamanChat, PeamanUser, Function())? onLongPressedChat;

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
  Widget build(BuildContext context, WidgetRef ref) {
    if (chats != null) {
      if (chats!.isEmpty) return _emptyBuilder();
      return _dataBuilder(context, chats!);
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
    return listBuilder?.call(context, chats) ??
        ListView.builder(
          itemCount: chats.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: itemBuilder ??
              (context, index) {
                final chat = chats[index];
                final widget = PeamanChatsListItem(
                  chat: chat,
                  onPressed: (chat, user) =>
                      onPressedChat?.call(
                        chat,
                        user,
                        () => _gotoChatConvoScreen(context, chat, user),
                      ) ??
                      _gotoChatConvoScreen(context, chat, user),
                  onLongPressed: (chat, user) =>
                      onLongPressedChat?.call(chat, user, () {}),
                );

                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: widget,
                  );
                }

                return widget;
              },
        );
  }

  Widget _emptyBuilder() {
    return emptyWidget ??
        const PeamanEmptyBuilder(
          title: "No chats found!",
          subTitle:
              "You haven't started conversation with anyone. Try searching people and start connecting.",
        );
  }

  Widget _loadingBuilder() {
    return loadingWidget ?? const PeamanSpinner();
  }

  Widget _errorBuilder(final String message) {
    return Center(
      child: PeamanText.subtitle1(message),
    );
  }

  void _gotoChatConvoScreen(
    final BuildContext context,
    final PeamanChat chat,
    final PeamanUser user,
  ) =>
      context.pushNamed(
        PeamanChatConversationScreen.route,
        arguments: PeamanChatConversationArgs(
          chatId: chat.id!,
          receivers: [user],
        ),
      );
}
