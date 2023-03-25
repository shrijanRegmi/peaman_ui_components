import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/peaman_chat_provider.dart';
import 'package:peaman_ui_components/src/features/shared/extensions/widget_extension.dart';

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
                        final chatsStream =
                            ref.read(providerOfPeamanUserChatsStream);
                        chatsStream.maybeWhen(
                          data: (data) {
                            final chat = data.firstWhere(
                              (element) =>
                                  element.userIds.contains(user.uid) &&
                                  element.type == PeamanChatType.oneToOne,
                              orElse: () => PeamanChat(
                                id: PeamanReferenceHelper().uniqueId,
                              ),
                            );
                            context.pushNamed(
                              PeamanChatConversationScreen.route,
                              arguments: PeamanChatConversationArgs(
                                chatId: chat.id!,
                                chatType: chat.type,
                                receiverIds: [user.uid!],
                              ),
                            );
                          },
                          orElse: () {},
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            PeamanRoundIconButton(
              onPressed: () {
                ref.read(providerOfPeamanAuth.notifier).signOut();
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
