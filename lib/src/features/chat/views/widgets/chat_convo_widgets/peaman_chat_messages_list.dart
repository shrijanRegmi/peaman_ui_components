import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessagesList extends PeamanWidget<PeamanChatMessagesListVM> {
  final String chatId;
  final PeamanUser friend;
  final List<PeamanMessage>? messages;
  final ScrollController? controller;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget Function(BuildContext, int)? itemBuilder;
  final Widget Function(BuildContext, List<PeamanMessage>)? listBuilder;
  final Function(PeamanMessage, PeamanUser, Function())? onPressedMessage;
  final Function(PeamanMessage, PeamanUser, Function())? onLongPressedMessage;
  final Function(PeamanMessage, PeamanUser, Function())? onSwippedMessage;

  const PeamanChatMessagesList({
    Key? key,
    required this.chatId,
    required this.friend,
    this.messages,
    this.controller,
    this.loadingWidget,
    this.emptyWidget,
    this.itemBuilder,
    this.listBuilder,
    this.onPressedMessage,
    this.onLongPressedMessage,
    this.onSwippedMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, PeamanChatMessagesListVM vm) {
    if (messages == null) {
      return StreamBuilder<List<PeamanMessage>>(
        stream: vm.messagesStream,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return loadingWidget ?? const PeamanSpinner();
          }

          if (snap.hasData && snap.data != null) {
            final messages = snap.data!;
            if (messages.isEmpty) {
              return emptyWidget ?? const SizedBox();
            }

            return _listBuilder(messages, vm);
          }

          return const SizedBox();
        },
      );
    } else {
      return _listBuilder(messages!, vm);
    }
  }

  Widget _listBuilder(
    final List<PeamanMessage> messages,
    final PeamanChatMessagesListVM vm,
  ) {
    return listBuilder?.call(vm.context, messages) ??
        ListView.separated(
          itemCount: messages.length,
          physics: const BouncingScrollPhysics(),
          reverse: true,
          controller: controller,
          itemBuilder: itemBuilder ??
              (context, index) {
                final message = messages[index];
                final messageDate = DateTime.fromMillisecondsSinceEpoch(
                  message.updatedAt!,
                );

                final nextMessageIndex = index <= 0 ? index : index - 1;
                final nextMessage = messages[nextMessageIndex];
                final nextMessageDate = DateTime.fromMillisecondsSinceEpoch(
                  nextMessage.updatedAt!,
                );

                // get the time difference between two messages
                final difference = nextMessageDate.difference(messageDate);

                final widget = PeamanChatMessagesListItem(
                  message: message,
                  nextMessage: nextMessage,
                  friend: friend,
                  isMessagesSentOnSameHour: difference.inMinutes < 60,
                  isFirstMessage: index == (messages.length - 1),
                  isLastMessage: index == 0,
                  onPressed: (message) =>
                      onPressedMessage?.call(message, friend, () {}),
                  onLongPressed: (message) =>
                      onLongPressedMessage?.call(
                        message,
                        friend,
                        () => vm.showMessageLongPressBottomsheet(message),
                      ) ??
                      vm.showMessageLongPressBottomsheet(message),
                  onSwipped: (message) =>
                      onSwippedMessage?.call(message, friend, () {}),
                );
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: widget,
                  );
                }
                return widget;
              },
          separatorBuilder: (context, index) {
            var prevMessageIndex = index + 1;

            final prevMessage = messages[prevMessageIndex];
            final message = messages[index];

            final prevMessageDate = DateTime.fromMillisecondsSinceEpoch(
              prevMessage.updatedAt!,
            );
            final messageDate = DateTime.fromMillisecondsSinceEpoch(
              message.updatedAt!,
            );

            final isSentNextDay = messageDate.year != prevMessageDate.year ||
                messageDate.month != prevMessageDate.month ||
                messageDate.day != prevMessageDate.day;

            if (!isSentNextDay) {
              return const SizedBox();
            }

            return PeamanChatMessagesDivider(
              message: message,
            );
          },
        );
  }

  @override
  PeamanChatMessagesListVM onCreateVM(BuildContext context) =>
      PeamanChatMessagesListVM(context: context, chatId: chatId);

  @override
  void onDispose(BuildContext context, PeamanChatMessagesListVM vm) {}

  @override
  void onInit(BuildContext context, PeamanChatMessagesListVM vm) => vm.onInit();
}
