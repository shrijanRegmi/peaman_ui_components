import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatsListVM extends PeamanBaseVM {
  PeamanChatsListVM({required super.context});

  // goto chat convo screen
  void gotoChatConvoScreen(
    final PeamanChat chat,
    final PeamanUser friend,
  ) {
    navigateNamed(
      PeamanRoutes.chatsConvoScreen,
      arguments: PeamanChatConversationArgs(
        chatId: chat.id!,
        friend: friend,
      ),
    );
  }
}
