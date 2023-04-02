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
  PeamanChat? get chat =>
      ref.watch(providerOfSinglePeamanChatFromChatsStream(widget.chatId));
  PeamanUser get appUser => ref.watch(providerOfLoggedInUser);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: chat == null
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PeamanAvatarBuilder.multiNetwork(
          [
            ..._getHeaderAvatars(),
            if (chat!.type == PeamanChatType.group) appUser.photo,
          ]..shuffle(),
          size: chat!.type == PeamanChatType.group ? 80.0 : 100.0,
          spreadFactor: 2.5,
        ),
        SizedBox(
          height: chat!.type == PeamanChatType.group ? 35.h : 10.h,
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
          ).pT(3),
        if (chat!.type == PeamanChatType.group) _groupActionsBuilder().pT(15),
      ],
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
        if (chat!.type == PeamanChatType.group)
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
        if (chat!.type == PeamanChatType.oneToOne)
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
        if (chat!.type == PeamanChatType.oneToOne)
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
        if (chat!.type == PeamanChatType.oneToOne)
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
    final blockedUsersStream = ref.watch(providerOfPeamanBlockedUsersStream);
    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(chat!.userIds),
    );

    final user = usersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success.first,
          (failure) => null,
        );
      },
      orElse: () => null,
    );

    final isUserBlocked = blockedUsersStream.maybeWhen(
      data: (data) => data.map((e) => e.uid).toList().contains(user?.uid),
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
        if (chat!.type == PeamanChatType.oneToOne)
          SwitchListTile(
            value: isUserBlocked,
            onChanged: (val) {
              showPeamanConfirmationDialog(
                context: context,
                title:
                    'Are you sure you want to ${isUserBlocked ? 'unblock' : 'block'} ${user?.name}?',
                description:
                    'This action is not permanent and you can decide to undo this action at any time.',
                onConfirm: () {
                  Future.delayed(const Duration(milliseconds: 200), () {
                    ref
                        .read(providerOfPeamanUser.notifier)
                        .toggleBlockUnblock(user!.uid!);
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
          onTap: () {},
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
          onTap: () {},
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
    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(chat!.userIds),
    );

    return usersFuture.maybeWhen(
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
        chat!.userIds.where((element) => element != appUser.uid).toList();
    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(chat!.userIds),
    );

    return usersFuture.maybeWhen(
      data: (data) {
        final remaining = receiverIds.length - 1;
        return data.when(
          (success) => success.isEmpty
              ? 'Chat Conversation'
              : remaining == 0
                  ? chat!.type == PeamanChatType.group
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
    if (chat!.type == PeamanChatType.group) return null;

    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(chat!.userIds),
    );

    return usersFuture.maybeWhen(
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
    if (chat!.type == PeamanChatType.group) return '';

    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(chat!.userIds),
    );

    return usersFuture.maybeWhen(
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
