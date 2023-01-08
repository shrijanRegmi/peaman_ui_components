import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatConversationArgs {
  final String chatId;
  final PeamanUser friend;

  PeamanChatConversationArgs({
    required this.chatId,
    required this.friend,
  });
}

class PeamanChatConversationScreen
    extends PeamanWidget<PeamanChatConversationVM> {
  final String chatId;
  final PeamanUser friend;

  const PeamanChatConversationScreen({
    super.key,
    required this.chatId,
    required this.friend,
  });

  @override
  Widget build(BuildContext context, PeamanChatConversationVM vm) {
    final unreadMessages = vm.chat.unreadMessages
        .firstWhere(
          (element) => element.uid == vm.appUser.uid,
          orElse: () => PeamanUnreadMessage(),
        )
        .unreadMessagesCount;
    final isUnread = unreadMessages > 0;
    if (isUnread) {
      vm.readMessage();
    }

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            if (friend.uid == vm.appUserReadOnly.uid) return;
          },
          behavior: HitTestBehavior.opaque,
          child: PeamanText.subtitle2(
            friend.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          iconSize: 20.0,
          onPressed: () => vm.popNavigate(),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: PeamanChatMessagesList(
          chatId: chatId,
          friend: friend,
          onSwippedMessage: (message, user, func) {
            vm.requestFocus(vm.focusNode);
            vm.updateMessageToReply(message);
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: PeamanChatMessageInput(
          chatId: chatId,
          focusNode: vm.focusNode,
          messageToReply: vm.messageToReply,
          replyingTo: vm.messageToReply == null ? null : friend,
          onPressedCancelReply: (func) {
            vm.updateMessageToReply(null);
          },
        ),
      ),
    );
  }

  @override
  PeamanChatConversationVM onCreateVM(BuildContext context) =>
      PeamanChatConversationVM(context: context, chatId: chatId);

  @override
  void onDispose(BuildContext context, PeamanChatConversationVM vm) {}

  @override
  void onInit(BuildContext context, PeamanChatConversationVM vm) {}
}
