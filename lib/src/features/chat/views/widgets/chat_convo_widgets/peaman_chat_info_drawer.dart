import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PeamanChatInfoDrawer extends ConsumerStatefulWidget {
  final String chatId;

  const PeamanChatInfoDrawer({
    super.key,
    required this.chatId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanChatInfoDrawerState();
}

class _PeamanChatInfoDrawerState extends ConsumerState<PeamanChatInfoDrawer> {
  bool _isAvatarShuffled = false;
  Provider<PeamanChat?> get _chatProvider =>
      providerOfSinglePeamanChatFromChatsStream(widget.chatId);

  String get _uid => ref.watch(
        providerOfLoggedInUser.select((value) => value.uid!),
      );
  String? get _chatId => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value?.id),
      );
  PeamanListWrapper<String> get _chatUserIdsWrapper => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.activeUserIdsWrapper),
      );
  AsyncValue<PeamanEither<List<PeamanUser>, PeamanError>>
      get _chatUsersFuture =>
          ref.watch(providerOfPeamanChatUsersFuture(_chatUserIdsWrapper));

  PeamanChatType get _chatType => ref.watch(
        _chatProvider.select((value) => value!.type),
      );

  PeamanListWrapper<PeamanChatMutedUntil> get _chatUserMutedUntilsWrapper =>
      ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.mutedUntilsWrapper),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: _chatId.isNull
            ? const PeamanErrorBuilder(
                title: "Couldn't Load Chat",
                subTitle:
                    'The chat may have be deleted. Please visit this place later.',
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => context.pop(),
                          splashRadius: 20.r,
                          icon: const Icon(Icons.close_rounded),
                        ),
                      ],
                    ).pL(10).pT(10),
                    _headerBuilder(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(
                      height: 25.h,
                    ),
                    _chatActionsSet1Builder(),
                    Divider(
                      height: 25.h,
                    ),
                    _chatActionsSet2Builder(),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _headerBuilder() {
    final appUserPhoto = ref.watch(
      providerOfLoggedInUser.select((value) => value.photo),
    );
    final avatars = [
      ..._getHeaderAvatars(),
      if (_chatType == PeamanChatType.group) appUserPhoto,
    ];

    if (!_isAvatarShuffled) {
      _isAvatarShuffled = true;
      avatars.shuffle();
    }
    return Container(
      constraints: BoxConstraints(
        minHeight: 170.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PeamanAvatarBuilder.multiNetwork(
            avatars,
            size: _chatType == PeamanChatType.group ? 80.0 : 100.0,
            spreadFactor: 2.5,
          ),
          SizedBox(
            height: _chatType == PeamanChatType.group ? 35.h : 10.h,
          ),
          PeamanText.subtitle2(
            _getHeaderTitle(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (_getHeaderBody() != null)
            PeamanText.body2(
              _getHeaderBody(),
              style: TextStyle(
                fontSize: 12.sp,
                color: PeamanColors.greyDark,
              ),
              textAlign: TextAlign.center,
            ).pT(3),
          if (_chatType == PeamanChatType.group) _groupActionsBuilder().pT(15),
        ],
      ).pX(20),
    );
  }

  Widget _chatActionsSet1Builder() {
    return Column(
      children: [
        ListTile(
          leading: PeamanRoundIconButton(
            icon: Icon(
              Icons.image_rounded,
              color: PeamanColors.white,
              size: 12.w,
            ),
            padding: EdgeInsets.all(7.w),
            bgColor: context.theme.colorScheme.primary,
          ),
          minLeadingWidth: 10.w,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 0.0,
          ),
          title: PeamanText.subtitle1(
            'Media, links and files',
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          onTap: () => context.pushNamed(
            PeamanViewChatMediasScreen.route,
            arguments: PeamanViewChatMediasScreenArgs(
              chatId: widget.chatId,
            ),
          ),
        ),
        if (_chatType == PeamanChatType.group)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.groups_rounded,
                color: PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            minLeadingWidth: 10.w,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: PeamanText.subtitle1(
              'Group members',
              style: TextStyle(fontSize: 12.sp),
            ),
            onTap: () {
              showPeamanNormalBottomsheet(
                context: context,
                borderRadius: 15.0,
                widget: PeamanUsersListPopup.expandedByUids(
                  userIds: _chatUserIdsWrapper.values,
                  title: 'Group Members',
                  onPressedUser: (user) {
                    showPeamanChatUserInfoDialog(
                      context: context,
                      onSelectOption: (val) {},
                    );
                  },
                ),
              );
            },
          ),
        if (_chatType == PeamanChatType.oneToOne)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.group_add_rounded,
                color: PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            minLeadingWidth: 10.w,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: PeamanText.subtitle1(
              'Add to group',
              style: TextStyle(fontSize: 12.sp),
            ),
            onTap: () {},
          ),
        if (_chatType == PeamanChatType.oneToOne)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.group,
                color: PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            minLeadingWidth: 10.w,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: PeamanText.subtitle1(
              'Groups in common',
              style: TextStyle(fontSize: 12.sp),
            ),
            onTap: () {},
          ),
        if (_chatType == PeamanChatType.oneToOne)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.email_rounded,
                color: PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            minLeadingWidth: 10.w,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PeamanText.subtitle1(
                  'External contact',
                  style: TextStyle(fontSize: 12.sp),
                ),
                PeamanText.body2(
                  _getExternalContact(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: PeamanColors.greyDark,
                  ),
                ),
              ],
            ),
            onTap: _lauchExternalContact,
          ),
      ],
    );
  }

  Widget _chatActionsSet2Builder() {
    final blockedUsersStream = ref.watch(providerOfPeamanBlockedUsersStream);

    final chatUsers = _chatUsersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success,
          (failure) => <PeamanUser>[],
        );
      },
      orElse: () => <PeamanUser>[],
    );
    final firstChatUser = chatUsers.isEmpty ? null : chatUsers.first;

    final isUserBlocked = blockedUsersStream.maybeWhen(
      data: (data) => data.map((e) => e.uid).toList().contains(
            firstChatUser?.uid,
          ),
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
          onChanged: (val) {
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
                options: options,
                borderRadius: 15.0,
                onSelectOption: (option) {
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
                });
          },
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
            onChanged: (val) {
              showPeamanConfirmationDialog(
                context: context,
                title:
                    'Are you sure you want to ${isUserBlocked ? 'unblock' : 'block'} ${firstChatUser?.name}?',
                description:
                    'This action is not permanent and you can decide to undo this action at any time.',
                onConfirm: () {
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
            },
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
          onTap: () {
            showPeamanConfirmationDialog(
              context: context,
              title: 'Are you sure you want to archive this chat?',
              description:
                  'This chat will not be shown in your chats list until you or ${firstChatUser?.name} sends a new message to this chat.',
              onConfirm: () {
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
          },
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
          onTap: () {
            showPeamanConfirmationDialog(
              context: context,
              title: 'Are you sure you want to delete this chat?',
              description:
                  'This will result in deleting the chat from your end only and losing all the messages corresponding to this chat. However, ${firstChatUser?.name} can still see the messages.',
              onConfirm: () {
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
          },
        ),
      ],
    );
  }

  Widget _groupActionsBuilder() {
    return Container(
      constraints: BoxConstraints(maxWidth: 130.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PeamanRoundIconButton(
            icon: Icon(
              Icons.group_add_rounded,
              color: context.isDarkMode
                  ? PeamanColors.white
                  : PeamanColors.primary,
              size: 16.w,
            ),
            padding: EdgeInsets.all(9.w),
            bgColor: PeamanColors.extraLightGrey.withOpacity(0.2),
            onPressed: () {},
          ),
          SizedBox(
            width: 10.w,
          ),
          PeamanRoundIconButton(
            icon: Icon(
              Icons.logout_rounded,
              color: context.isDarkMode
                  ? PeamanColors.white
                  : PeamanColors.primary,
              size: 16.w,
            ),
            padding: EdgeInsets.all(9.w),
            bgColor: PeamanColors.extraLightGrey.withOpacity(0.2),
            onPressed: () {
              showPeamanConfirmationDialog(
                context: context,
                title: 'Are you sure you want to leave this chat?',
                description:
                    "You will neither be able to view new messages nor be able to send new messages to this chat until you are added back to the chat.",
                onConfirm: () {
                  const successLogMessage = 'You left the chat';
                  ref.read(providerOfPeamanChat.notifier).leaveChat(
                        chatId: widget.chatId,
                        successLogMessage: successLogMessage,
                      );

                  context.pop();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  List<String> _getHeaderAvatars() {
    return _chatUsersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success
              .where((element) => element.photo != null)
              .map((e) => e.photo!)
              .toList(),
          (failure) => [],
        );
      },
      loading: () => [],
      orElse: () => [],
    );
  }

  String _getHeaderTitle() {
    final receiverIds =
        _chatUserIdsWrapper.values.where((element) => element != _uid).toList();

    return _chatUsersFuture.maybeWhen(
      data: (data) {
        final remaining = receiverIds.length - 1;
        return data.when(
          (success) => success.isEmpty
              ? 'Chat Conversation'
              : remaining == 0
                  ? _chatType == PeamanChatType.group
                      ? 'You and ${success.first.name}'
                      : '${success.first.name}'
                  : 'You, ${success.first.name} and $remaining ${remaining > 1 ? 'others' : 'other'}',
          (failure) => PeamanCommonStrings.unknown,
        );
      },
      loading: () => PeamanCommonStrings.loading,
      orElse: () => PeamanCommonStrings.unknown,
    );
  }

  String? _getHeaderBody() {
    if (_chatType == PeamanChatType.group) return null;

    return _chatUsersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success.isEmpty ? null : success.first.bio,
          (failure) => null,
        );
      },
      orElse: () => null,
    );
  }

  String _getExternalContact() {
    if (_chatType == PeamanChatType.group) return '';

    return _chatUsersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success.isEmpty ? '' : success.first.email!,
          (failure) => '',
        );
      },
      orElse: () => PeamanCommonStrings.loading,
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

  void _lauchExternalContact() async {
    var url = '';
    final regexEmail = RegExp(PeamanCommonStrings.regexEmail);
    if (regexEmail.hasMatch(_getExternalContact())) {
      url = 'mailto:${_getExternalContact()}';
    }

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }
}
