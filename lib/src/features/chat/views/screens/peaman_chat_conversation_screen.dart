import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/peaman_chat_provider.dart';
import 'package:peaman_ui_components/src/features/shared/views/widgets/peaman_appbar.dart';

class PeamanChatConversationArgs {
  final String chatId;
  final PeamanChatType chatType;
  final List<PeamanUser> receivers;

  PeamanChatConversationArgs({
    required this.chatId,
    required this.chatType,
    required this.receivers,
  });
}

class PeamanChatConversationScreen extends ConsumerWidget {
  final String chatId;
  final PeamanChatType chatType;
  final List<PeamanUser> receivers;

  const PeamanChatConversationScreen({
    super.key,
    required this.chatId,
    required this.chatType,
    required this.receivers,
  });

  static const route = '/peaman_chat_conversation_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(providerOfPeamanChat.notifier);
    final chat = notifier.getSingleChat(chatId, readOnly: false) ??
        PeamanChat(id: chatId, type: chatType);

    notifier.readChat(chatId: chatId);

    return Scaffold(
      appBar: PeamanAppbar(
        title: chat.type == PeamanChatType.oneToOne
            ? '${receivers.first.name}'
            : 'Group Chat',
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: PeamanChatMessagesList(
          chatId: chatId,
          receivers: receivers,
          onSwippedMessage: (message, user, func) {},
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: PeamanChatMessageInput(
          chatId: chatId,
          receivers: receivers,
        ),
      ),
    );
  }
}
