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

class PeamanChatConversationScreen extends ConsumerStatefulWidget {
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
  ConsumerState<PeamanChatConversationScreen> createState() =>
      _PeamanChatConversationScreenState();
}

class _PeamanChatConversationScreenState
    extends ConsumerState<PeamanChatConversationScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      if (mounted) {
        ref.read(providerOfPeamanChat.notifier).readChat(chatId: widget.chatId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chat =
        ref.watch(providerOfSinglePeamanChatFromChatsStream(widget.chatId));

    if (chat != null) {
      ref.listen(providerOfSinglePeamanChatFromChatsStream(widget.chatId),
          (previous, next) {
        ref.read(providerOfPeamanChat.notifier).readChat(chatId: widget.chatId);
      });
    }

    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(widget.receiverIds),
    );

    return WillPopScope(
      onWillPop: () async {
        ref.read(providerOfPeamanChat.notifier)
          ..setTypingStatus(chatId: widget.chatId, typedValue: '')
          ..clearValues();
        return true;
      },
      child: Scaffold(
        appBar: PeamanAppbar(
          title: usersFuture.maybeWhen(
            data: (data) {
              final remaining = widget.receiverIds.length - 1;
              return data.when(
                (success) => success.isEmpty
                    ? 'Chat Conversation'
                    : remaining == 0
                        ? '${success.first.name}'
                        : '${success.first.name} and $remaining ${remaining > 1 ? 'others' : 'other'}',
                (failure) => 'Unknown',
              );
            },
            loading: () => 'Loading...',
            orElse: () => 'Unknown',
          ),
          onPressedLeading: (def) {
            ref.read(providerOfPeamanChat.notifier)
              ..setTypingStatus(chatId: widget.chatId, typedValue: '')
              ..clearValues();
            def();
          },
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: PeamanChatMessagesList(
            chatId: widget.chatId,
            receiverIds: widget.receiverIds,
            onSwippedMessage: (message, user, func) {},
          ),
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: PeamanChatMessageInput(
            chatId: widget.chatId,
            chatType: widget.chatType,
            receiverIds: widget.receiverIds,
          ),
        ),
      ),
    );
  }
}
