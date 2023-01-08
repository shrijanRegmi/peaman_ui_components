import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatsList extends PeamanWidget<PeamanChatsListVM> {
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
  Widget build(BuildContext context, PeamanChatsListVM vm) {
    final thisChats = chats ?? vm.chats;

    if (thisChats == null) return loadingWidget ?? const PeamanSpinner();
    if (thisChats.isEmpty) {
      return emptyWidget ??
          const PeamanEmptyBuilder(
            title: "No chats found!",
            subTitle:
                "You haven't started conversation with anyone. Try searching people and start connecting.",
          );
    }
    return listBuilder?.call(context, thisChats) ??
        ListView.builder(
          itemCount: thisChats.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: itemBuilder ??
              (context, index) {
                final chat = thisChats[index];
                final widget = PeamanChatsListItem(
                  chat: chat,
                  onPressed: (chat, user) =>
                      onPressedChat?.call(
                        chat,
                        user,
                        () => vm.gotoChatConvoScreen(chat, user),
                      ) ??
                      vm.gotoChatConvoScreen(chat, user),
                  onLongPressedChat: (chat, user) =>
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

  @override
  PeamanChatsListVM onCreateVM(BuildContext context) =>
      PeamanChatsListVM(context: context);

  @override
  void onDispose(BuildContext context, PeamanChatsListVM vm) {}

  @override
  void onInit(BuildContext context, PeamanChatsListVM vm) {}
}
