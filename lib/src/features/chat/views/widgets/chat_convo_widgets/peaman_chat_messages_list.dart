import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessagesList extends ConsumerStatefulWidget {
  final String chatId;
  final List<String> receiverIds;
  final List<PeamanChatMessage>? messages;
  final ScrollController? controller;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget Function(BuildContext, WidgetRef, PeamanChatMessage)?
      itemBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanChatMessage)?
      sentMessageBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanChatMessage)?
      receivedMessageBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? senderInfoBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanChatMessage)?
      dividerBuilder;
  final Widget Function(BuildContext, WidgetRef, List<PeamanChatMessage>)?
      listBuilder;
  final Function(PeamanChatMessage, List<String>, Function())? onPressedMessage;
  final Function(PeamanChatMessage, List<String>, Function())?
      onLongPressedMessage;
  final Function(PeamanChatMessage, List<String>, Function())? onSwippedMessage;

  const PeamanChatMessagesList({
    Key? key,
    required this.chatId,
    required this.receiverIds,
    this.messages,
    this.controller,
    this.loadingWidget,
    this.emptyWidget,
    this.itemBuilder,
    this.sentMessageBuilder,
    this.receivedMessageBuilder,
    this.senderInfoBuilder,
    this.dividerBuilder,
    this.listBuilder,
    this.onPressedMessage,
    this.onLongPressedMessage,
    this.onSwippedMessage,
  }) : super(key: key);

  @override
  ConsumerState<PeamanChatMessagesList> createState() =>
      _PeamanChatMessagesListState();
}

class _PeamanChatMessagesListState
    extends ConsumerState<PeamanChatMessagesList> {
  @override
  Widget build(BuildContext context) {
    if (widget.messages != null) {
      if (widget.messages!.isEmpty) return _emptyBuilder();
      return _dataBuilder(context, widget.messages!);
    }

    final messagesStream = ref.watch(
      providerOfPeamanChatMessagesStream(widget.chatId),
    );
    return messagesStream.when(
      data: (data) {
        final tempMessages = ref.watch(
          providerOfPeamanChat.select((value) => value.tempMessages),
        );
        final messages = [
          ...tempMessages
              .where((element) => element.chatId == widget.chatId)
              .toList(),
          ...data
        ];
        if (messages.isEmpty) return _emptyBuilder();
        return _dataBuilder(context, messages);
      },
      error: (e, _) => _errorBuilder(e.toString()),
      loading: () => _loadingBuilder(),
    );
  }

  Widget _dataBuilder(
    final BuildContext context,
    final List<PeamanChatMessage> messages,
  ) {
    return widget.listBuilder?.call(context, ref, messages) ??
        ListView.separated(
          itemCount: messages.length,
          physics: const BouncingScrollPhysics(),
          reverse: true,
          controller: widget.controller,
          itemBuilder: (context, index) {
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

            final thisWidget =
                widget.itemBuilder?.call(context, ref, message) ??
                    PeamanChatMessagesListItem(
                      message: message,
                      nextMessage: nextMessage,
                      receiverIds: widget.receiverIds,
                      isMessagesSentOnSameHour: difference.inMinutes < 60,
                      isFirstMessage: index == (messages.length - 1),
                      isLastMessage: index == 0,
                      sentMessageBuilder: widget.sentMessageBuilder,
                      receivedMessageBuilder: widget.sentMessageBuilder,
                      senderInfoBuilder: widget.senderInfoBuilder,
                      onPressed: (message) => widget.onPressedMessage
                          ?.call(message, widget.receiverIds, () {}),
                      onLongPressed: (message) =>
                          widget.onLongPressedMessage?.call(
                            message,
                            widget.receiverIds,
                            () => _showMessageLongPressBottomsheet(message),
                          ) ??
                          _showMessageLongPressBottomsheet(message),
                      onSwipped: (message) => widget.onSwippedMessage
                          ?.call(message, widget.receiverIds, () {}),
                    );
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: thisWidget,
              );
            }
            return thisWidget;
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

            return widget.dividerBuilder?.call(context, ref, message) ??
                PeamanChatMessagesDivider(
                  message: message,
                );
          },
        );
  }

  Widget _emptyBuilder() {
    return widget.emptyWidget ?? const SizedBox();
  }

  Widget _loadingBuilder() {
    return widget.loadingWidget ?? const PeamanSpinner();
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
