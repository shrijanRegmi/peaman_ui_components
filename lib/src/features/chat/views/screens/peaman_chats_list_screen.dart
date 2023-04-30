import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatsListScreen extends ConsumerStatefulWidget {
  final bool searchUsersGlobally;

  const PeamanChatsListScreen({
    super.key,
    this.searchUsersGlobally = false,
  });

  static const route = '/peaman_chats_list_screen';

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
      body: const PeamanChatsList(
        lastItemPadding: EdgeInsets.only(bottom: 100.0),
      ),
      floatingActionButton: const PeamanChatInitiatorButton(),
    );
  }
}
