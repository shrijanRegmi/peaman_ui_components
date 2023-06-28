import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatInfoDrawerGroupChatActions extends ConsumerStatefulWidget {
  const PeamanChatInfoDrawerGroupChatActions({
    super.key,
    required this.chatId,
  });

  final String chatId;

  @override
  ConsumerState<PeamanChatInfoDrawerGroupChatActions> createState() =>
      _PeamanChatInfoDrawerGroupChatActionsState();
}

class _PeamanChatInfoDrawerGroupChatActionsState
    extends ConsumerState<PeamanChatInfoDrawerGroupChatActions> {
  PeamanListWrapper<String> get _chatUserIdsWrapper => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.activeUserIdsWrapper),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 130.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PeamanRoundIconButton(
            icon: Icon(
              Icons.group_add_rounded,
              color: context.isDarkMode
                  ? PeamanColors.white70
                  : context.theme.colorScheme.primary,
              size: 16.w,
            ),
            padding: EdgeInsets.all(9.w),
            bgColor: PeamanColors.extraLightGrey.withOpacity(0.2),
            onPressed: _addChatMembers,
          ),
          SizedBox(
            width: 10.w,
          ),
          PeamanRoundIconButton(
            icon: Icon(
              Icons.logout_rounded,
              color: context.isDarkMode
                  ? PeamanColors.white70
                  : context.theme.colorScheme.primary,
              size: 16.w,
            ),
            padding: EdgeInsets.all(9.w),
            bgColor: PeamanColors.extraLightGrey.withOpacity(0.2),
            onPressed: _leaveChat,
          ),
        ],
      ),
    );
  }

  void _addChatMembers() {
    showPeamanNormalBottomsheet(
      context: context,
      borderRadius: 15,
      widget: PeamanUsersListPopup.bySuggested(
        filterBuilder: (context, ref, users) => users
            .where(
              (element) => !_chatUserIdsWrapper.values.contains(
                element.uid,
              ),
            )
            .toList(),
        title: 'Add Members',
        searchType: PeamanSearchType.global,
        selectionType: PeamanSelectionType.multi,
        searchFilterBuilder: (context, ref, users) => users
            .where(
              (element) => !_chatUserIdsWrapper.values.contains(
                element.uid,
              ),
            )
            .toList(),
        onPressedProceed: (context, ref, users, def) {
          context.pop();

          showPeamanConfirmationDialog(
            context: context,
            title: PeamanCommonStrings.confirmationTitleAddToChat(
              users: users,
            ),
            description: PeamanCommonStrings.confirmationDescAddToChat(
              users: users,
            ),
            onConfirm: (context, ref) {
              final successLogMessage =
                  PeamanCommonStrings.successLogAddedToChat(
                users: users,
              );
              ref.read(providerOfPeamanChat.notifier).addChatMembers(
                    chatId: widget.chatId,
                    friendIds: users.map((e) => e.uid!).toList(),
                    successLogMessage: successLogMessage,
                  );
            },
          );
        },
      ),
    );
  }

  void _leaveChat() {
    showPeamanConfirmationDialog(
      context: context,
      title: 'Are you sure you want to leave this chat?',
      description:
          "You will neither be able to view new messages nor be able to send new messages to this chat until you are added back to the chat.",
      onConfirm: (context, ref) {
        const successLogMessage = 'You left the chat';
        ref.read(providerOfPeamanChat.notifier).leaveChat(
              chatId: widget.chatId,
              successLogMessage: successLogMessage,
            );
      },
    );
  }
}
