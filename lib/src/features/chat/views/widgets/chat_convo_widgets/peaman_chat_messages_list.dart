import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/peaman_chat_provider.dart';

class PeamanChatMessagesList extends ConsumerWidget {
  final String chatId;
  final List<PeamanUser> receivers;
  final List<PeamanChatMessage>? messages;
  final ScrollController? controller;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget Function(BuildContext, int)? itemBuilder;
  final Widget Function(BuildContext, List<PeamanChatMessage>)? listBuilder;
  final Function(PeamanChatMessage, List<PeamanUser>, Function())?
      onPressedMessage;
  final Function(PeamanChatMessage, List<PeamanUser>, Function())?
      onLongPressedMessage;
  final Function(PeamanChatMessage, List<PeamanUser>, Function())?
      onSwippedMessage;

  const PeamanChatMessagesList({
    Key? key,
    required this.chatId,
    required this.receivers,
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
  Widget build(BuildContext context, WidgetRef ref) {
    if (messages != null) {
      if (messages!.isEmpty) return _emptyBuilder();
      return _dataBuilder(context, messages!);
    }

    final messagesStream = ref.watch(
      providerOfPeamanChatMessagesStream(chatId),
    );
    return messagesStream.when(
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
    final List<PeamanChatMessage> messages,
  ) {
    return listBuilder?.call(context, messages) ??
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
                  receivers: receivers,
                  isMessagesSentOnSameHour: difference.inMinutes < 60,
                  isFirstMessage: index == (messages.length - 1),
                  isLastMessage: index == 0,
                  onPressed: (message) =>
                      onPressedMessage?.call(message, receivers, () {}),
                  onLongPressed: (message) =>
                      onLongPressedMessage?.call(
                        message,
                        receivers,
                        () => _showMessageLongPressBottomsheet(message),
                      ) ??
                      _showMessageLongPressBottomsheet(message),
                  onSwipped: (message) =>
                      onSwippedMessage?.call(message, receivers, () {}),
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

  Widget _emptyBuilder() {
    return emptyWidget ?? const SizedBox();
  }

  Widget _loadingBuilder() {
    return loadingWidget ?? const PeamanSpinner();
  }

  Widget _errorBuilder(final String message) {
    return Center(
      child: PeamanText.subtitle1(message),
    );
  }

  void _showMessageLongPressBottomsheet(final PeamanChatMessage message) {
    // TODO(shrijanRegmi)
  }
}
