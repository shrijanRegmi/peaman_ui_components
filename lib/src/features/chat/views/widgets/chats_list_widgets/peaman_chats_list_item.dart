import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  byChat,
  byChatId,
  byChatProvider,
}

typedef _ChatProvider = AsyncValue<PeamanChat>;

class PeamanChatsListItem extends ConsumerStatefulWidget {
  const PeamanChatsListItem.byChat({
    super.key,
    required this.chat,
    this.padding,
    this.builder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.onPressed,
    this.onLongPressed,
  })  : type = _Type.byChat,
        chatId = '',
        chatProvider = null;

  const PeamanChatsListItem.byChatId({
    super.key,
    required this.chatId,
    this.padding,
    this.builder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.onPressed,
    this.onLongPressed,
  })  : type = _Type.byChatId,
        chat = const PeamanChat(),
        chatProvider = null;

  const PeamanChatsListItem.byChatProvider({
    super.key,
    required this.chatProvider,
    this.padding,
    this.builder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.onPressed,
    this.onLongPressed,
  })  : type = _Type.byChatProvider,
        chat = const PeamanChat(),
        chatId = '',
        assert(
          chatProvider != null,
          'chatProvider cannot be null',
        );

  final _Type type;

  final PeamanChat chat;
  final String chatId;
  final _ChatProvider Function(
    BuildContext,
    WidgetRef,
  )? chatProvider;

  final EdgeInsets? padding;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? builder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
  )? headerBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
  )? bodyBuilder;
  final List<Widget> Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
  )? actionsBuilder;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanError,
  )? errorBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? loadingBuilder;

  final Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
    Function(),
  )? onPressed;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
    Function(),
  )? onLongPressed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanChatsListItemState();
}

class _PeamanChatsListItemState extends ConsumerState<PeamanChatsListItem> {
  @override
  Widget build(BuildContext context) {
    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(widget.chat.activeUserIdsWrapper),
    );
    return usersFuture.when(
      data: (data) {
        return data.when(
          _dataBuilder,
          _errorBuilder,
        );
      },
      error: (e, _) => _errorBuilder(
        PeamanError(message: e.toString()),
      ),
      loading: _loadingBuilder,
    );
  }

  Widget _dataBuilder(final List<PeamanUser> users) {
    switch (widget.type) {
      case _Type.byChat:
        return _byChatTypeBuilder(users);
      case _Type.byChatId:
        return _byChatIdTypeBuilder(users);
      case _Type.byChatProvider:
        return _byChatProviderTypeBuilder(users);
      default:
        return const SizedBox();
    }
  }

  Widget _byChatTypeBuilder(final List<PeamanUser> users) {
    return _chatBuilder(widget.chat, users);
  }

  Widget _byChatIdTypeBuilder(final List<PeamanUser> users) {
    final chatFuture = ref.watch(
      providerOfPeamanSingleChatByIdStream(widget.chatId),
    );
    return chatFuture.when(
      data: (data) => _chatBuilder(data, users),
      error: (e, _) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }

  Widget _byChatProviderTypeBuilder(final List<PeamanUser> users) {
    final chatFuture = widget.chatProvider?.call(context, ref);
    return chatFuture!.when(
      data: (data) => _chatBuilder(data, users),
      error: (e, _) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }

  Widget _chatBuilder(final PeamanChat chat, final List<PeamanUser> users) {
    if (chat.id.isNull) return const SizedBox();

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.4,
        children: widget.actionsBuilder?.call(context, ref, chat, users) ??
            [
              Expanded(
                child: PeamanChatArchiveButton(chat: chat),
              ),
              Expanded(
                child: PeamanChatDeleteButton(chat: chat),
              )
            ],
      ),
      child: Padding(
        padding: widget.padding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 15.h,
            ),
        child: widget.builder?.call(context, ref, chat) ??
            Column(
              children: [
                widget.headerBuilder?.call(context, ref, chat, users) ??
                    PeamanChatItemHeader(
                      chat: chat,
                      users: users,
                    ).pB(users.length > 1 ? 15.0 : 5.0),
                widget.bodyBuilder?.call(context, ref, chat, users) ??
                    PeamanChatItemBody(
                      chat: chat,
                      users: users,
                    ),
              ],
            ),
      ),
    )
        .onPressed(
          () => widget.onPressed != null
              ? widget.onPressed?.call(
                  context,
                  ref,
                  chat,
                  users,
                  () => _gotoChatConvoScreen(chat),
                )
              : _gotoChatConvoScreen(chat),
        )
        .onLongPressed(
          () => widget.onLongPressed?.call(
            context,
            ref,
            chat,
            users,
            () {},
          ),
        );
  }

  Widget _errorBuilder(final PeamanError error) {
    return widget.errorBuilder?.call(context, ref, error) ??
        PeamanErrorBuilder(
          subTitle: error.message,
        );
  }

  Widget _loadingBuilder() {
    return widget.loadingBuilder?.call(context, ref) ?? const SizedBox();
  }

  void _gotoChatConvoScreen(final PeamanChat chat) {
    context.pushNamed(
      PeamanChatConversationScreen.route,
      arguments: PeamanChatConversationArgs.byChatId(
        chatId: chat.id!,
      ),
    );
  }
}
