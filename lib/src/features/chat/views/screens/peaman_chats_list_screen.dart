import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatsListScreen extends PeamanWidget<PeamanChatsListVM> {
  final bool searchUsersGlobally;

  const PeamanChatsListScreen({
    super.key,
    this.searchUsersGlobally = false,
  });

  @override
  Widget build(BuildContext context, PeamanChatsListVM vm) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: _searchBuilder(vm),
      ),
      body: const PeamanChatsList(),
    );
  }

  Widget _searchBuilder(final PeamanChatsListVM vm) {
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
                  vm.navigate(
                    PeamanUsersSearchScreen(
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

  @override
  PeamanChatsListVM onCreateVM(BuildContext context) =>
      PeamanChatsListVM(context: context);

  @override
  void onDispose(BuildContext context, PeamanChatsListVM vm) {}

  @override
  void onInit(BuildContext context, PeamanChatsListVM vm) {}
}
