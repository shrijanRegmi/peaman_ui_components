import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: _searchBuilder(context),
      ),
      body: const PeamanChatsList(),
      floatingActionButton: const PeamanChatInitiatorButton(),
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
                      searchUsersGlobally: widget.searchUsersGlobally,
                      onPressedUser: (user) {
                        final appUser = ref.read(providerOfLoggedInUser);
                        context
                          ..pop()
                          ..pushNamed(
                            PeamanChatConversationScreen.route,
                            arguments: PeamanChatConversationArgs.byUserIds(
                              userIds: [user.uid!, appUser.uid!]..sort(),
                              chatType: PeamanChatType.oneToOne,
                            ),
                          );
                      },
                    ),
                  );
                },
              ),
            ),
            PeamanRoundIconButton(
              onPressed: () {
                showPeamanConfirmationDialog(
                  context: context,
                  title: 'Are you sure you want to logout?',
                  onConfirm: () {
                    ref.read(providerOfPeamanAuth.notifier).signOut();
                  },
                );
              },
              icon: Icon(
                Icons.logout,
                size: 20.w,
              ),
            ).pB(10).pR(10),
          ],
        ),
      ),
    );
  }
}
