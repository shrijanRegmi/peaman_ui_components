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
  Provider<PeamanChat?> get _chatProvider =>
      providerOfSinglePeamanChatFromChatsStream(widget.chatId);

  String get uid => ref.watch(
        providerOfLoggedInUser.select((value) => value.uid!),
      );
  List<String> get _chatUserIds => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.userIds),
      );
  AsyncValue<PeamanEither<List<PeamanUser>, PeamanError>>
      get _chatUsersFuture =>
          ref.watch(providerOfPeamanChatUsersFuture(_chatUserIds));
  PeamanChatType get _chatType => ref.watch(
        _chatProvider.select((value) => value!.type),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: ref.read(
                  providerOfSinglePeamanChatFromChatsStream(widget.chatId),
                ) ==
                null
            ? const PeamanErrorBuilder(
                title: "Couldn't Load Chat",
                subTitle:
                    'The chat may have be deleted. Please\nvisit this place later.',
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
    final appUserPhoto = ref.read(
      providerOfLoggedInUser.select((value) => value.photo),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PeamanAvatarBuilder.multiNetwork(
          [
            ..._getHeaderAvatars(),
            if (_chatType == PeamanChatType.group) appUserPhoto,
          ]..shuffle(),
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
    ).pX(20);
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
            bgColor: context.isDarkMode
                ? PeamanColors.containerBgDark
                : PeamanColors.secondary,
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
              bgColor: context.isDarkMode
                  ? PeamanColors.containerBgDark
                  : PeamanColors.secondary,
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
            onTap: () {},
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
              bgColor: context.isDarkMode
                  ? PeamanColors.containerBgDark
                  : PeamanColors.secondary,
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
              bgColor: context.isDarkMode
                  ? PeamanColors.containerBgDark
                  : PeamanColors.secondary,
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
              bgColor: context.isDarkMode
                  ? PeamanColors.containerBgDark
                  : PeamanColors.secondary,
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
    final blockedUsersStream = ref.read(providerOfPeamanBlockedUsersStream);

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

    return Column(
      children: [
        SwitchListTile(
          value: false,
          onChanged: (val) {},
          activeColor: context.isDarkMode
              ? PeamanColors.containerBgDark
              : PeamanColors.secondary,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 0.0,
          ),
          title: PeamanText.subtitle1(
            'Mute chat',
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
                    ref
                        .read(providerOfPeamanUser.notifier)
                        .toggleBlockUnblock(firstChatUser!.uid!);
                  });
                },
              );
            },
            activeColor: context.isDarkMode
                ? PeamanColors.containerBgDark
                : PeamanColors.secondary,
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
                const successLogMessage = 'Successfully archived chat';
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
                const successLogMessage = 'Successfully deleted chat';
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
                  : PeamanColors.secondary,
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
                  : PeamanColors.secondary,
              size: 16.w,
            ),
            padding: EdgeInsets.all(9.w),
            bgColor: PeamanColors.extraLightGrey.withOpacity(0.2),
            onPressed: () {},
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
        _chatUserIds.where((element) => element != uid).toList();

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
