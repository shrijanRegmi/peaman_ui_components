import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatInfoDrawerActionsPart2 extends ConsumerStatefulWidget {
  const PeamanChatInfoDrawerActionsPart2({
    super.key,
    required this.chatId,
  });

  final String chatId;

  @override
  ConsumerState<PeamanChatInfoDrawerActionsPart2> createState() =>
      _PeamanChatInfoDrawerActionsPart2State();
}

class _PeamanChatInfoDrawerActionsPart2State
    extends ConsumerState<PeamanChatInfoDrawerActionsPart2> {
  String get _uid => ref.watch(
        providerOfLoggedInUser.select((value) => value.uid!),
      );

  PeamanListWrapper<PeamanChatMutedUntil> get _chatUserMutedUntilsWrapper =>
      ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.mutedUntilsWrapper),
      );
  PeamanChatType get _chatType => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.type),
      );
  PeamanListWrapper<String> get _chatUserIdsWrapper => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.activeUserIdsWrapper),
      );
  AsyncValue<PeamanEither<List<PeamanUser>, PeamanError>>
      get _chatUsersFuture => ref.watch(
            providerOfPeamanChatUsersFuture(_chatUserIdsWrapper),
          );

  @override
  Widget build(BuildContext context) {
    final blockedUsersStream = ref.watch(providerOfPeamanBlockedUsersStream);
    final firstChatUser = _getFirstChatUser();

    final isUserBlocked = blockedUsersStream.maybeWhen(
      data: (data) =>
          data.map((e) => e.uid).toList().contains(firstChatUser?.uid),
      orElse: () => false,
    );

    final chatMutedUntil = _chatUserMutedUntilsWrapper.values.firstWhere(
      (element) => element.uid == _uid,
      orElse: PeamanChatMutedUntil.new,
    );

    return Column(
      children: [
        SwitchListTile(
          value: chatMutedUntil.mutedUntil != null,
          onChanged: (val) => _muteUnmuteChat(),
          activeColor: context.isDarkMode
              ? PeamanColors.containerBgDark
              : PeamanColors.primary,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 0.0,
          ),
          title: PeamanText.subtitle1(
            _getMutedUntilText(chatMutedUntil),
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
        if (_chatType == PeamanChatType.oneToOne)
          SwitchListTile(
            value: isUserBlocked,
            onChanged: (val) => _blockUnblockUser(
              isUserBlocked: isUserBlocked,
            ),
            activeColor: context.isDarkMode
                ? PeamanColors.containerBgDark
                : PeamanColors.primary,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: PeamanText.subtitle1(
              'Block user',
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 0.0,
          ),
          title: PeamanText.subtitle1(
            'Archive chat',
            style: TextStyle(fontSize: 12.sp),
          ),
          onTap: _archiveChat,
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 0.0,
          ),
          title: PeamanText.subtitle1(
            'Delete chat',
            style: TextStyle(
              fontSize: 12.sp,
              color: PeamanColors.red,
            ),
          ),
          onTap: _deleteChat,
        ),
      ],
    );
  }

  String _getMutedUntilText(final PeamanChatMutedUntil chatMutedUntil) {
    if (chatMutedUntil.mutedAt.isNull || chatMutedUntil.mutedUntil.isNull) {
      return 'Mute chat';
    }

    if (chatMutedUntil.mutedUntil == -1) {
      return 'Muted until manually changed';
    }

    final mutedAtDate =
        DateTime.fromMillisecondsSinceEpoch(chatMutedUntil.mutedAt!);
    final mutedUntilDate =
        DateTime.fromMillisecondsSinceEpoch(chatMutedUntil.mutedUntil!);

    final duration = mutedUntilDate.difference(mutedAtDate);
    return 'Muted for ${duration.inHours.toString()} hour';
  }

  PeamanUser? _getFirstChatUser() {
    final chatUsers = _chatUsersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success,
          (failure) => <PeamanUser>[],
        );
      },
      orElse: () => <PeamanUser>[],
    );
    return chatUsers.isEmpty ? null : chatUsers.first;
  }

  void _muteUnmuteChat() {
    final chatMutedUntil = _chatUserMutedUntilsWrapper.values.firstWhere(
      (element) => element.uid == _uid,
      orElse: PeamanChatMutedUntil.new,
    );
    if (chatMutedUntil.mutedUntil != null) {
      const successLogMessage = 'The chat has been unmuted';
      ref.read(providerOfPeamanChat.notifier).unmuteChat(
            chatId: widget.chatId,
            successLogMessage: successLogMessage,
          );
      return;
    }

    final options = [
      const PeamanSelectableOption(
        id: 0,
        title: 'For 1 hour',
      ),
      const PeamanSelectableOption(
        id: 1,
        title: 'For 2 hours',
      ),
      const PeamanSelectableOption(
        id: 2,
        title: 'For 8 hours',
      ),
      const PeamanSelectableOption(
        id: 3,
        title: 'For 24 hours',
      ),
      const PeamanSelectableOption(
        id: 4,
        title: 'Until I turn it on',
      ),
    ];
    showPeamanSelectableOptionsBottomsheet(
      context: context,
      optionsBuilder: (context, ref) => options,
      borderRadius: 15.0,
      onSelectOption: (context, ref, option) {
        final currentDate = DateTime.now();
        int? mutedUntilHours;
        switch (option.id) {
          case 0:
            mutedUntilHours = 1;
            break;
          case 1:
            mutedUntilHours = 2;
            break;
          case 2:
            mutedUntilHours = 8;
            break;
          case 3:
            mutedUntilHours = 24;
            break;
          case 4:
            mutedUntilHours = -1;
            break;
          default:
        }

        if (mutedUntilHours != null) {
          final mutedAt = currentDate.millisecondsSinceEpoch;
          var mutedUntil = -1;

          if (mutedUntilHours == -1) {
            mutedUntil = -1;
          } else {
            final muteUntilDate = currentDate.add(
              Duration(hours: mutedUntilHours),
            );
            mutedUntil = muteUntilDate.millisecondsSinceEpoch;
          }

          final successLogMessage = mutedUntilHours == -1
              ? 'The chat has been muted until you turn it back on'
              : 'The chat has been muted for $mutedUntilHours ${mutedUntilHours > 1 ? 'hours' : 'hour'}';

          if (chatMutedUntil.mutedUntil.isNull) {
            ref.read(providerOfPeamanChat.notifier).muteChat(
                  chatId: widget.chatId,
                  mutedAt: mutedAt,
                  mutedUntil: mutedUntil,
                  successLogMessage: successLogMessage,
                );
          }
        }
      },
    );
  }

  void _blockUnblockUser({required final bool isUserBlocked}) {
    final firstChatUser = _getFirstChatUser();
    showPeamanConfirmationDialog(
      context: context,
      title:
          'Are you sure you want to ${isUserBlocked ? 'unblock' : 'block'} ${firstChatUser?.name}?',
      description:
          'This action is not permanent and you can decide to undo this action at any time.',
      onConfirm: (context, ref) {
        Future.delayed(const Duration(milliseconds: 200), () {
          final successLogMessage =
              '${firstChatUser?.name} has been ${isUserBlocked ? 'unblocked' : 'blocked'}';
          ref.read(providerOfPeamanUser.notifier).toggleBlockUnblock(
                friendId: firstChatUser!.uid!,
                successLogMessage: successLogMessage,
              );
        });
      },
    );
  }

  void _archiveChat() {
    final firstChatUser = _getFirstChatUser();
    showPeamanConfirmationDialog(
      context: context,
      title: 'Are you sure you want to archive this chat?',
      description:
          'This chat will not be shown in your chats list until you or ${_chatType == PeamanChatType.group ? 'other members send' : '${firstChatUser?.name} sends'} a new message to this chat.',
      onConfirm: (context, ref) {
        const successLogMessage = 'The chat has been archived';
        ref.read(providerOfPeamanChat.notifier).archiveChat(
              chatId: widget.chatId,
              successLogMessage: successLogMessage,
            );

        context
          ..pop()
          ..pop();
      },
    );
  }

  void _deleteChat() {
    final firstChatUser = _getFirstChatUser();
    showPeamanConfirmationDialog(
      context: context,
      title: 'Are you sure you want to delete this chat?',
      description:
          'This will result in deleting the chat from your end only and losing all the messages corresponding to this chat. However, ${_chatType == PeamanChatType.group ? 'other members' : firstChatUser?.name} can still see the messages.',
      onConfirm: (context, ref) {
        const successLogMessage = 'The chat has been deleted';
        ref.read(providerOfPeamanChat.notifier).deleteChat(
              chatId: widget.chatId,
              successLogMessage: successLogMessage,
            );

        context
          ..pop()
          ..pop();
      },
    );
  }
}
