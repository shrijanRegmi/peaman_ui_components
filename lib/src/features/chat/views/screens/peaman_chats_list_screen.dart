import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatsListScreen extends ConsumerWidget {
  final bool searchUsersGlobally;

  const PeamanChatsListScreen({
    super.key,
    this.searchUsersGlobally = false,
  });

  static const route = '/peaman_chats_list_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: _searchBuilder(context),
      ),
      body: const PeamanChatsList(),
    );
  }

  Widget _searchBuilder(final BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          children: [
            Expanded(
              child: PeamanInput(
                hintText: 'Search...',
                height: 40.0,
                enabled: false,
                leading: Icon(
                  Icons.search_rounded,
                  color: PeamanColors.grey.withOpacity(0.8),
                ),
                onPressed: () {
                  context.pushNamed(
                    PeamanUsersSearchScreen.route,
                    arguments: PeamanUsersSearchArgs(
                      searchUsersGlobally: searchUsersGlobally,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
