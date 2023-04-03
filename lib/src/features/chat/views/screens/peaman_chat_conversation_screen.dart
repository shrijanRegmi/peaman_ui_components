import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatConversationArgs {
  final String chatId;
  final PeamanChatType chatType;
  final List<String> userIds;

  PeamanChatConversationArgs({
    required this.chatId,
    required this.chatType,
    required this.userIds,
  });
}

class PeamanChatConversationScreen extends ConsumerStatefulWidget {
  final String chatId;
  final PeamanChatType chatType;
  final List<String> userIds;

  const PeamanChatConversationScreen({
    super.key,
    required this.chatId,
    required this.chatType,
    required this.userIds,
  });

  static const route = '/peaman_chat_conversation_screen';

  @override
  ConsumerState<PeamanChatConversationScreen> createState() =>
      _PeamanChatConversationScreenState();
}

class _PeamanChatConversationScreenState
    extends ConsumerState<PeamanChatConversationScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
    final uid = ref.watch(providerOfLoggedInUser.select((value) => value.uid));

    ref.listen(providerOfSinglePeamanChatFromChatsStream(widget.chatId),
        (previous, next) {
      if (previous != next) {
        ref.read(providerOfPeamanChat.notifier).readChat(chatId: widget.chatId);
      }
    });

    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(widget.userIds),
    );

    final receiverIds =
        widget.userIds.where((element) => element != uid).toList();

    return WillPopScope(
      onWillPop: () async {
        ref.read(providerOfPeamanChat.notifier)
          ..setTypingStatus(chatId: widget.chatId, typedValue: '')
          ..clearValues();
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PeamanAppbar(
          title: usersFuture.maybeWhen(
            data: (data) {
              final remaining = receiverIds.length - 1;
              return data.when(
                (success) => success.isEmpty
                    ? 'Chat Conversation'
                    : remaining == 0
                        ? widget.chatType == PeamanChatType.group
                            ? 'You and ${success.first.name}'
                            : '${success.first.name}'
                        : 'You, ${success.first.name} and $remaining ${remaining > 1 ? 'others' : 'other'}',
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
          actions: [
            IconButton(
              onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
              icon: const Icon(Icons.more_vert_rounded),
            )
          ],
        ),
        endDrawer: PeamanChatInfoDrawer(
          chatId: widget.chatId,
          userIds: widget.userIds,
        ),
        body: PeamanChatMessagesList(
          chatId: widget.chatId,
          receiverIds: receiverIds,
          onSwippedMessage: (message, user, func) {},
        ).onPressed(() => context.unfocus()),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: PeamanChatMessageInput(
            chatId: widget.chatId,
            chatType: widget.chatType,
            receiverIds: receiverIds,
          ),
        ),
      ),
    );
  }
}
