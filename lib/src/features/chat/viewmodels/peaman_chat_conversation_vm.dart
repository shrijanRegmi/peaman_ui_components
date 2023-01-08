import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatConversationVM extends PeamanBaseVM {
  final String chatId;

  PeamanChatConversationVM({
    required super.context,
    required this.chatId,
  });

  PeamanMessage? _messageToReply;
  FocusNode _focusNode = FocusNode();

  PeamanMessage? get messageToReply => _messageToReply;
  FocusNode get focusNode => _focusNode;
  PeamanChat get chat => _getCurrentChat(context);
  PeamanChat get chatReadOnly => _getCurrentChat(globalContext, readOnly: true);

  // read messages of user
  void readMessage() {
    PChatProvider.readMessage(
      chatId: chatReadOnly.id!,
      uid: appUserReadOnly.uid!,
    );
  }

  // request focus on focusNode
  void requestFocus(final FocusNode newVal) {
    _focusNode.unfocus();

    _focusNode = newVal;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 10), () {
      _focusNode.requestFocus();
    });
  }

  // get current chat
  PeamanChat _getCurrentChat(
    final BuildContext c, {
    final bool readOnly = false,
  }) {
    if (readOnly) {
      return c.pread<List<PeamanChat>>().firstWhere(
            (element) => element.id == chatId,
            orElse: () => PeamanChat(
              id: chatId,
              userIds: [appUserReadOnly.uid!],
            ),
          );
    }
    return c.pwatch<List<PeamanChat>>().firstWhere(
          (element) => element.id == chatId,
          orElse: () => PeamanChat(
            id: chatId,
            userIds: [appUserReadOnly.uid!],
          ),
        );
  }

  // update messsageToReply
  void updateMessageToReply(final PeamanMessage? newVal) {
    _messageToReply = newVal;
    notifyListeners();
  }
}
