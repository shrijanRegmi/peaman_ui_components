import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/peaman_chat_provider.dart';
import 'package:peaman_ui_components/src/features/shared/views/widgets/peaman_appbar.dart';

class PeamanChatConversationArgs {
  final String chatId;
  final PeamanChatType chatType;
  final List<String> receiverIds;

  PeamanChatConversationArgs({
    required this.chatId,
    required this.chatType,
    required this.receiverIds,
  });
}

class PeamanChatConversationScreen extends ConsumerWidget {
  final String chatId;
  final PeamanChatType chatType;
  final List<String> receiverIds;

  const PeamanChatConversationScreen({
    super.key,
    required this.chatId,
    required this.chatType,
    required this.receiverIds,
  });

  static const route = '/peaman_chat_conversation_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(providerOfPeamanChat.notifier);
    final chat = ref.watch(providerOfSinglePeamanChatFromChatsStream(chatId)) ??
        PeamanChat(id: chatId, type: chatType);

    // notifier.readChat(chatId: chatId);

    final receiverFuture = ref.watch(
      providerOfSingleUserByIdFuture(receiverIds.first),
    );

    return Scaffold(
      appBar: PeamanAppbar(
        title: chat.type == PeamanChatType.oneToOne
            ? receiverFuture.maybeWhen(
                data: (data) {
                  return data.when(
                    (success) => '${success.name}',
                    (failure) => 'Unknown',
                  );
                },
                orElse: () => 'Unknown',
              )
            : 'Group Chat',
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: PeamanChatMessagesList(
          chatId: chatId,
          receiverIds: receiverIds,
          onSwippedMessage: (message, user, func) {},
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: PeamanChatMessageInput(
          chatId: chatId,
          receiverIds: receiverIds,
        ),
      ),
    );
  }
}
