import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

Future<T?> showPeamanChatUserInfoDialog<T>({
  required final BuildContext context,
  required final PeamanUser user,
  required final String chatId,
  final Function(BuildContext, WidgetRef, PeamanSelectableOption, Function())?
      onSelectOption,
}) {
  void defaultOnSelectOption(
    BuildContext context,
    WidgetRef ref,
    PeamanSelectableOption option,
  ) {
    final uid = ref.read(
      providerOfLoggedInUser.select((value) => value.uid!),
    );
    switch (option.id) {
      case 0:
        context
          ..pop()
          ..pushNamed(
            PeamanChatConversationScreen.route,
            arguments: PeamanChatConversationArgs.byUserIds(
              userIds: [uid, user.uid!]..sort(),
              chatType: PeamanChatType.oneToOne,
            ),
          );
        break;
      case 2:
        showPeamanConfirmationDialog(
          context: context,
          title: PeamanCommonStrings.confirmationTitleRemoveFromChat(
            user: user,
          ),
          description: PeamanCommonStrings.confirmationDescRemoveFromChat(
            user: user,
          ),
          onConfirm: (context, ref) {
            ref.read(providerOfPeamanChat.notifier).removeChatMembers(
                  chatId: chatId,
                  friendIds: [user.uid!],
                  successLogMessage:
                      PeamanCommonStrings.successLogRemoveFromChat(
                    user: user,
                  ),
                );
          },
        );
        break;
      case 3:
        showPeamanConfirmationDialog(
          context: context,
          title: PeamanCommonStrings.confirmationTitleAddBackToChat(
            user: user,
          ),
          description: PeamanCommonStrings.confirmationDescAddBackToChat(
            user: user,
          ),
          onConfirm: (context, ref) {
            ref.read(providerOfPeamanChat.notifier).addChatMembers(
                  chatId: chatId,
                  friendIds: [user.uid!],
                  successLogMessage:
                      PeamanCommonStrings.successLogAddedBackToChat(
                    user: user,
                  ),
                );
          },
        );
        break;
      default:
    }
  }

  return showPeamanSelectableOptionsDialog<T>(
    context: context,
    borderRadius: 15.0,
    radio: false,
    itemPadding: EdgeInsets.symmetric(
      horizontal: 30.w,
      vertical: 0,
    ),
    padding: EdgeInsets.symmetric(vertical: 10.h),
    optionsBuilder: (context, ref) {
      final chatActiveUserIdsWrapper = ref.watch(
        providerOfSinglePeamanChatFromChatsStream(chatId).select(
          (value) => value?.activeUserIdsWrapper,
        ),
      );
      final chatAdminId = ref.watch(
        providerOfSinglePeamanChatFromChatsStream(chatId).select(
          (value) => value?.chatRequestSenderId,
        ),
      );
      final chatType = ref.watch(
        providerOfSinglePeamanChatFromChatsStream(chatId).select(
          (value) => value?.type,
        ),
      );
      final uid = ref.watch(
        providerOfLoggedInUser.select((value) => value.uid!),
      );
      final isChatAdmin = chatAdminId == uid;
      final isGroupChat = chatType == PeamanChatType.group;
      final isRemoved =
          !(chatActiveUserIdsWrapper?.values.contains(user.uid) ?? false);

      return [
        PeamanSelectableOption(
          id: 0,
          leading: PeamanRoundIconButton(
            icon: Icon(
              Icons.send,
              color: PeamanColors.white,
              size: 12.w,
            ),
            padding: EdgeInsets.all(7.w),
            bgColor: context.theme.colorScheme.primary,
          ),
          title: 'Send message',
        ),
        PeamanSelectableOption(
          id: 1,
          leading: PeamanRoundIconButton(
            icon: Icon(
              Icons.person_rounded,
              color: PeamanColors.white,
              size: 12.w,
            ),
            padding: EdgeInsets.all(7.w),
            bgColor: context.theme.colorScheme.primary,
          ),
          title: 'View profile',
        ),
        if (isGroupChat && isChatAdmin && !isRemoved)
          PeamanSelectableOption(
            id: 2,
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.group_remove_rounded,
                color: PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            title: 'Remove from group',
          ),
        if (isGroupChat && isRemoved)
          PeamanSelectableOption(
            id: 3,
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.group_remove_rounded,
                color: PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            title: 'Add back to group',
          ),
        PeamanSelectableOption(
          id: 4,
          leading: PeamanRoundIconButton(
            icon: Icon(
              Icons.group_add_rounded,
              color: PeamanColors.white,
              size: 12.w,
            ),
            padding: EdgeInsets.all(7.w),
            bgColor: context.theme.colorScheme.primary,
          ),
          title: 'Add to another group',
        ),
      ];
    },
    onSelectOption: (context, ref, option) {
      if (onSelectOption != null) {
        onSelectOption.call(
          context,
          ref,
          option,
          () => defaultOnSelectOption(context, ref, option),
        );
      } else {
        defaultOnSelectOption(context, ref, option);
      }
    },
  );
}

Future<T?> showPeamanChatInitiatorDialog<T>({
  required final BuildContext context,
  final Function(BuildContext, WidgetRef, PeamanSelectableOption, Function())?
      onSelectOption,
}) {
  void defaultOnSelectOption(
    BuildContext context,
    WidgetRef ref,
    PeamanSelectableOption option,
  ) {
    switch (option.id) {
      case 0:
        showPeamanNormalBottomsheet(
          context: context,
          widget: PeamanUsersListPopup.expandedByUids(
            userIds: const [],
            title: 'New Chat',
            searchType: PeamanSearchType.global,
            onPressedUser: (context, ref, user) {
              final uid =
                  ref.read(providerOfLoggedInUser.select((value) => value.uid));

              context
                ..pop()
                ..pushNamed(
                  PeamanChatConversationScreen.route,
                  arguments: PeamanChatConversationArgs.byUserIds(
                    userIds: [uid!, user.uid!]..sort(),
                    chatType: PeamanChatType.oneToOne,
                  ),
                );
            },
          ),
        );
        break;
      case 1:
        showPeamanNormalBottomsheet(
          context: context,
          widget: PeamanUsersListPopup.expandedByUids(
            userIds: const [],
            title: 'New Group Chat',
            searchType: PeamanSearchType.global,
            onPressedUser: (context, ref, user) {
              final uid =
                  ref.read(providerOfLoggedInUser.select((value) => value.uid));

              context
                ..pop()
                ..pushNamed(
                  PeamanChatConversationScreen.route,
                  arguments: PeamanChatConversationArgs.byUserIds(
                    userIds: [uid!, user.uid!]..sort(),
                    chatType: PeamanChatType.group,
                  ),
                );
            },
          ),
        );
        break;
      default:
    }
  }

  return showPeamanSelectableOptionsDialog<T>(
    context: context,
    borderRadius: 15.0,
    radio: false,
    itemPadding: EdgeInsets.symmetric(
      horizontal: 25.w,
      vertical: 0,
    ),
    optionsBuilder: (context, ref) {
      return [
        PeamanSelectableOption(
          id: 0,
          leading: PeamanRoundIconButton(
            icon: Icon(
              Icons.send,
              color: PeamanColors.white,
              size: 12.w,
            ),
            padding: EdgeInsets.all(7.w),
            bgColor: context.theme.colorScheme.primary,
          ),
          title: 'New chat',
        ),
        PeamanSelectableOption(
          id: 1,
          leading: PeamanRoundIconButton(
            icon: Icon(
              Icons.send,
              color: PeamanColors.white,
              size: 12.w,
            ),
            padding: EdgeInsets.all(7.w),
            bgColor: context.theme.colorScheme.primary,
          ),
          title: 'New group chat',
        ),
      ];
    },
    onSelectOption: (context, ref, option) {
      if (onSelectOption != null) {
        onSelectOption.call(
          context,
          ref,
          option,
          () => defaultOnSelectOption(context, ref, option),
        );
      } else {
        defaultOnSelectOption(context, ref, option);
      }
    },
  );
}
