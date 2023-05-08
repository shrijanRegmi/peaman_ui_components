import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman/peaman.dart';

import '../../../../auth/auth.dart';
import '../../../../chat/providers/peaman_chat_provider.dart';
import '../../../../shared/shared.dart';
import 'peaman_chats_list_item.dart';

enum _Type {
  normal,
  byChats,
  byChatIds,
  byChatsProvider,
}

typedef _ChatsProvider = AsyncValue<List<PeamanChat>>;

class PeamanChatsList extends ConsumerStatefulWidget {
  const PeamanChatsList({
    super.key,
    this.listBuilderByChats,
    this.firstItemPadding,
    this.itemPadding,
    this.lastItemPadding,
    this.shrinkWrap = false,
    this.physics = const BouncingScrollPhysics(),
    this.itemBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.normal,
        chats = const [],
        chatIds = const [],
        chatsProvider = null,
        listBuilderByChatIds = null;

  const PeamanChatsList.byChats({
    super.key,
    required this.chats,
    this.listBuilderByChats,
    this.firstItemPadding,
    this.itemPadding,
    this.lastItemPadding,
    this.shrinkWrap = false,
    this.physics = const BouncingScrollPhysics(),
    this.itemBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byChats,
        chatIds = const [],
        chatsProvider = null,
        listBuilderByChatIds = null;

  const PeamanChatsList.byChatIds({
    super.key,
    required this.chatIds,
    this.listBuilderByChatIds,
    this.firstItemPadding,
    this.itemPadding,
    this.lastItemPadding,
    this.shrinkWrap = false,
    this.physics = const BouncingScrollPhysics(),
    this.itemBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byChatIds,
        chats = const [],
        chatsProvider = null,
        listBuilderByChats = null;

  const PeamanChatsList.byChatsProvider({
    super.key,
    required this.chatsProvider,
    this.listBuilderByChats,
    this.firstItemPadding,
    this.itemPadding,
    this.lastItemPadding,
    this.shrinkWrap = false,
    this.physics = const BouncingScrollPhysics(),
    this.itemBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byChatsProvider,
        chats = const [],
        chatIds = const [],
        listBuilderByChatIds = null,
        assert(
          chatsProvider != null,
          'chatsProvider cannot be null',
        );

  final _Type type;

  final List<PeamanChat> chats;
  final List<String> chatIds;
  final _ChatsProvider Function(
    BuildContext,
    WidgetRef,
  )? chatsProvider;

  final EdgeInsets? firstItemPadding;
  final EdgeInsets? itemPadding;
  final EdgeInsets? lastItemPadding;

  final bool shrinkWrap;
  final ScrollPhysics physics;

  final Widget Function(
    BuildContext,
    WidgetRef,
    List<PeamanChat>,
  )? listBuilderByChats;
  final Widget Function(
    BuildContext,
    WidgetRef,
    List<String>,
  )? listBuilderByChatIds;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? itemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? emptyBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? loadingBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanError,
  )? errorBuilder;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? headerBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? bodyBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? actionsBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanChatsListState();
}

class _PeamanChatsListState extends ConsumerState<PeamanChatsList> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case _Type.normal:
        return _normalTypeListBuilder();
      case _Type.byChats:
        return _byChatsTypeListBuilder();
      case _Type.byChatIds:
        return _byChatIdsTypeListBuilder();
      case _Type.byChatsProvider:
        return _byChatProviderTypeListBuilder();
      default:
        return const SizedBox();
    }
  }

  Widget _normalTypeListBuilder() {
    final chatsProvider = ref.watch(providerOfPeamanUserChatsStream);
    return chatsProvider.when(
      data: (data) {
        final uid = ref.watch(
          providerOfLoggedInUser.select((value) => value.uid),
        );

        var chats = data
            .where((element) => !element.hiddenToUserIds.contains(uid))
            .toList();
        if (chats.isEmpty) return _emptyBuilder();
        return _chatsListBuilder(chats);
      },
      error: (e, _) => _errorBuilder(
        PeamanError(message: e.toString()),
      ),
      loading: _loadingBuilder,
    );
  }

  Widget _byChatsTypeListBuilder() {
    return _chatsListBuilder(widget.chats);
  }

  Widget _byChatIdsTypeListBuilder() {
    return _chatIdsListBuilder(widget.chatIds);
  }

  Widget _byChatProviderTypeListBuilder() {
    final chatsProvider = widget.chatsProvider?.call(context, ref);
    return chatsProvider!.when(
      data: _chatsListBuilder,
      error: (e, _) => _errorBuilder(
        PeamanError(message: e.toString()),
      ),
      loading: _loadingBuilder,
    );
  }

  Widget _chatsListBuilder(final List<PeamanChat> chats) {
    return widget.listBuilderByChats?.call(context, ref, chats) ??
        ListView.separated(
          itemCount: chats.length,
          shrinkWrap: widget.shrinkWrap,
          physics: widget.physics,
          itemBuilder: (context, index) {
            final chat = chats[index];
            return PeamanChatsListItem.byChat(
              chat: chat,
              padding: index == 0
                  ? widget.firstItemPadding
                  : index == (chats.length - 1)
                      ? widget.lastItemPadding
                      : widget.itemPadding,
              builder: widget.itemBuilder,
              headerBuilder: widget.headerBuilder,
              bodyBuilder: widget.bodyBuilder,
              actionsBuilder: widget.actionsBuilder,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0.0,
            );
          },
        );
  }

  Widget _chatIdsListBuilder(final List<String> chatIds) {
    return widget.listBuilderByChatIds?.call(context, ref, chatIds) ??
        ListView.separated(
          itemCount: chatIds.length,
          shrinkWrap: widget.shrinkWrap,
          physics: widget.physics,
          itemBuilder: (context, index) {
            final chatId = chatIds[index];
            return PeamanChatsListItem.byChatId(
              chatId: chatId,
              padding: index == 0
                  ? widget.firstItemPadding
                  : index == (chatIds.length - 1)
                      ? widget.lastItemPadding
                      : widget.itemPadding,
              builder: widget.itemBuilder,
              headerBuilder: widget.headerBuilder,
              bodyBuilder: widget.bodyBuilder,
              actionsBuilder: widget.actionsBuilder,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0.0,
            );
          },
        );
  }

  Widget _emptyBuilder() {
    return widget.emptyBuilder?.call(context, ref) ??
        const PeamanEmptyBuilder(
          title: "No chats found!",
          subTitle:
              "You haven't started conversation with anyone. Try searching people and start connecting.",
        );
  }

  Widget _loadingBuilder() {
    return widget.loadingBuilder?.call(context, ref) ?? const PeamanSpinner();
  }

  Widget _errorBuilder(final PeamanError error) {
    return widget.errorBuilder?.call(context, ref, error) ??
        Center(
          child: PeamanText.subtitle1(error.message),
        );
  }
}
