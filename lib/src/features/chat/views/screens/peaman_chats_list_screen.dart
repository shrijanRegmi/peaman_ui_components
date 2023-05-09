import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatsListScreen extends ConsumerStatefulWidget {
  final bool searchUsersGlobally;

  const PeamanChatsListScreen({
    super.key,
    this.searchUsersGlobally = false,
    this.headerBuilder,
    this.listBuilder,
    this.floatingActionButtonBuilder,
  });

  static const route = '/peaman_chats_list_screen';

  final PreferredSizeWidget Function(
    BuildContext,
    WidgetRef,
  )? headerBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? listBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? floatingActionButtonBuilder;

  @override
  ConsumerState<PeamanChatsListScreen> createState() =>
      _PeamanChatsListScreenState();
}

class _PeamanChatsListScreenState extends ConsumerState<PeamanChatsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PeamanChatListScreenHeader(
        searchUsersGlobally: widget.searchUsersGlobally,
      ),
      body: PeamanChatsList(
        lastItemPadding: EdgeInsets.only(
          top: 15.w,
          bottom: 100.w,
          left: 20.w,
          right: 20.w,
        ),
      ),
      floatingActionButton: const PeamanChatInitiatorButton(),
    );
  }
}
