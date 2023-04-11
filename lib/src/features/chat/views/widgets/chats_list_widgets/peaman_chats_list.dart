import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatsList extends ConsumerStatefulWidget {
  final List<PeamanChat>? chats;
  final ScrollController? controller;
  final EdgeInsets firstItemPadding;
  final EdgeInsets lastItemPadding;
  final Widget Function(BuildContext, WidgetRef, PeamanChat)? itemBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanChat)? avatarBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanChat)? titleBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanChat)? bodyBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanChat)? dateBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanChat)? counterBuilder;
  final List<Widget> Function(BuildContext, WidgetRef, PeamanChat)?
      actionWidgetsBuilder;
  final Widget Function(BuildContext, WidgetRef, List<PeamanChat>)? listBuilder;
  final Widget Function(BuildContext, WidgetRef)? loadingBuilder;
  final Widget Function(BuildContext, WidgetRef)? emptyBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanError)? errorBuilder;
  final Function(PeamanChat, Function())? onPressedChat;
  final Function(PeamanChat, Function())? onLongPressedChat;

  const PeamanChatsList({
    super.key,
    this.chats,
    this.controller,
    this.firstItemPadding = const EdgeInsets.all(0.0),
    this.lastItemPadding = const EdgeInsets.all(0.0),
    this.itemBuilder,
    this.avatarBuilder,
    this.titleBuilder,
    this.bodyBuilder,
    this.dateBuilder,
    this.counterBuilder,
    this.actionWidgetsBuilder,
    this.listBuilder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
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
        final uid = ref.watch(
          providerOfLoggedInUser.select((value) => value.uid),
        );

        final chats = data
            .where((element) => !element.hiddenToUserIds.contains(uid))
            .toList();
        if (chats.isEmpty) return _emptyBuilder();
        return _dataBuilder(context, chats);
      },
      error: (e, _) => _errorBuilder(PeamanError(message: e.toString())),
      loading: () => _loadingBuilder(),
    );
  }

  Widget _dataBuilder(
    final BuildContext context,
    final List<PeamanChat> chats,
  ) {
    return widget.listBuilder?.call(context, ref, chats) ??
        ListView.builder(
          itemCount: chats.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final chat = chats[index];

            final chatItemWidget =
                widget.itemBuilder?.call(context, ref, chat) ??
                    PeamanChatsListItem(
                      chat: chat,
                      actionWidgetsBuilder: widget.actionWidgetsBuilder,
                      avatarBuilder: widget.avatarBuilder,
                      titleBuilder: widget.titleBuilder,
                      bodyBuilder: widget.bodyBuilder,
                      dateBuilder: widget.dateBuilder,
                      counterBuilder: widget.counterBuilder,
                      onPressed: (chat) =>
                          widget.onPressedChat?.call(
                            chat,
                            () => _gotoChatConvoScreen(context, chat),
                          ) ??
                          _gotoChatConvoScreen(context, chat),
                      onLongPressed: (chat) =>
                          widget.onLongPressedChat?.call(chat, () {}),
                    );

            return Padding(
              padding: index == 0
                  ? widget.firstItemPadding
                  : index == (chats.length - 1)
                      ? widget.lastItemPadding
                      : const EdgeInsets.only(top: 0.0),
              child: chatItemWidget,
            );
          },
        );
  }

  Widget _emptyBuilder() {
    return widget.emptyBuilder?.call(context, ref) ??
        const PeamanEmptyBuilder(
          title: "No chats found!",
          subTitle:
              "You haven't started conversation with anyone. Try searching people and start connecting.",
        );
  }

  Widget _loadingBuilder() {
    return widget.loadingBuilder?.call(context, ref) ?? const PeamanSpinner();
  }

  Widget _errorBuilder(final PeamanError error) {
    return widget.errorBuilder?.call(context, ref, error) ??
        Center(
          child: PeamanText.subtitle1(error.message),
        );
  }

  void _gotoChatConvoScreen(
    final BuildContext context,
    final PeamanChat chat,
  ) {
    context.pushNamed(
      PeamanChatConversationScreen.route,
      arguments: PeamanChatConversationArgs.byChatId(
        chatId: chat.id!,
      ),
    );
  }
}
