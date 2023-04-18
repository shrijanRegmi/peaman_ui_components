import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  byChatId,
  byUserIds,
}

class PeamanChatConversationArgs {
  final String chatId;
  final PeamanChatType chatType;
  final List<String> userIds;

  PeamanChatConversationArgs.byChatId({
    required this.chatId,
  })  : userIds = const [],
        chatType = PeamanChatType.oneToOne;

  PeamanChatConversationArgs.byUserIds({
    required this.userIds,
    required this.chatType,
  }) : chatId = '';
}

class PeamanChatConversationScreen extends ConsumerStatefulWidget {
  final String chatId;
  final PeamanChatType chatType;
  final List<String> userIds;
  final _Type type;

  const PeamanChatConversationScreen.byChatId({
    super.key,
    required this.chatId,
  })  : userIds = const [],
        type = _Type.byChatId,
        chatType = PeamanChatType.oneToOne;

  const PeamanChatConversationScreen.byUserIds({
    super.key,
    required this.userIds,
    required this.chatType,
  })  : chatId = '',
        type = _Type.byUserIds;

  static const route = '/peaman_chat_conversation_screen';

  @override
  ConsumerState<PeamanChatConversationScreen> createState() =>
      _PeamanChatConversationScreenState();
}

class _PeamanChatConversationScreenState
    extends ConsumerState<PeamanChatConversationScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String get _chatId {
    if (widget.type == _Type.byUserIds) {
      return ref.watch(providerOfPeamanUserChatsStream).maybeWhen(
        data: (data) {
          final index = data.indexWhere((element) {
            final elementUids = List<String>.from(element.userIds)..sort();
            final widgetUids = List<String>.from(widget.userIds)..sort();
            return listEquals(elementUids, widgetUids) &&
                element.type == widget.chatType;
          });
          if (index != -1) {
            return data[index].id!;
          }
          return ref.watch(
            providerOfSinglePeamanChatFromChatsStream(widget.chatId).select(
                (value) => value?.id ?? PeamanReferenceHelper().uniqueId),
          );
        },
        orElse: () {
          return ref.watch(
            providerOfSinglePeamanChatFromChatsStream(widget.chatId).select(
                (value) => value?.id ?? PeamanReferenceHelper().uniqueId),
          );
        },
      );
    }
    return ref.watch(
      providerOfSinglePeamanChatFromChatsStream(widget.chatId)
          .select((value) => value?.id ?? PeamanReferenceHelper().uniqueId),
    );
  }

  PeamanListWrapper<String> get _chatUserIdsWrapper => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(_chatId).select(
          (value) =>
              value?.activeUserIdsWrapper ??
              PeamanListWrapper<String>(values: widget.userIds),
        ),
      );

  PeamanChatType get _chatType =>
      ref.watch(providerOfSinglePeamanChatFromChatsStream(_chatId)
          .select((value) => value?.type ?? widget.chatType));

  String get _uid => ref.watch(
        providerOfLoggedInUser.select((value) => value.uid!),
      );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      if (mounted) {
        ref.read(providerOfPeamanChat.notifier).readChat(chatId: _chatId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(providerOfLoggedInUser.select((value) => value.uid));

    ref.listen(providerOfSinglePeamanChatFromChatsStream(_chatId),
        (previous, next) {
      if (previous != next) {
        ref.read(providerOfPeamanChat.notifier).readChat(chatId: _chatId);
      }
    });

    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(_chatUserIdsWrapper),
    );

    final receiverIds =
        _chatUserIdsWrapper.values.where((element) => element != uid).toList();

    return WillPopScope(
      onWillPop: () async {
        ref.read(providerOfPeamanChat.notifier)
          ..setTypingStatus(chatId: _chatId, typedValue: '')
          ..clearValues();
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PeamanAppbar(
          title: usersFuture.maybeWhen(
            data: (data) {
              return data.when(
                (success) => success.isEmpty ||
                        !_chatUserIdsWrapper.values.contains(_uid)
                    ? 'Unknown Conversation'
                    : ref.watch(
                        providerOfSinglePeamanChatFromChatsStream(_chatId)
                            .select(
                          (value) => value?.titleExt(success.first.name ?? ''),
                        ),
                      ),
                (failure) => 'Unknown',
              );
            },
            loading: () => 'Loading...',
            orElse: () => 'Unknown',
          ),
          onPressedLeading: (def) {
            ref.read(providerOfPeamanChat.notifier)
              ..setTypingStatus(chatId: _chatId, typedValue: '')
              ..clearValues();
            def();
          },
          actions: [
            if (_chatId.isNotEmpty && _chatUserIdsWrapper.values.contains(_uid))
              IconButton(
                onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                icon: const Icon(Icons.more_vert_rounded),
              )
          ],
        ),
        endDrawer: _chatId.isEmpty || !_chatUserIdsWrapper.values.contains(_uid)
            ? null
            : PeamanChatInfoDrawer(
                chatId: _chatId,
              ),
        body: PeamanChatMessagesList(
          chatId: _chatId,
          receiverIds: receiverIds,
          onSwippedMessage: (message, user, func) {},
        ).onPressed(() => context.unfocus()),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: PeamanChatMessageInput(
            chatId: _chatId,
            chatType: _chatType,
            receiverIds: receiverIds,
          ),
        ),
      ),
    );
  }
}
