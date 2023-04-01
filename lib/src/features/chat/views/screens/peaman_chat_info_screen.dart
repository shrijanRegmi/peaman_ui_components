import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatInfoScreenArgs {
  final String chatId;

  const PeamanChatInfoScreenArgs({
    required this.chatId,
  });
}

class PeamanChatInfoScreen extends ConsumerStatefulWidget {
  final String chatId;

  const PeamanChatInfoScreen({
    super.key,
    required this.chatId,
  });

  static const route = '/peaman_chat_info_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanChatInfoScreenState();
}

class _PeamanChatInfoScreenState extends ConsumerState<PeamanChatInfoScreen> {
  PeamanChat? get chat =>
      ref.watch(providerOfSinglePeamanChatFromChatsStream(widget.chatId));
  PeamanUser get appUser => ref.watch(providerOfLoggedInUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PeamanAppbar(
        title: 'Chat Info',
      ),
      body: chat == null
          ? const PeamanErrorBuilder(
              title: "Couldn't Load Chat",
              subTitle:
                  'The chat may have be deleted. Please\nvisit this place later.',
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
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
              ],
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
        PeamanText.subtitle1(
          _getHeaderTitle(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        if (_getHeaderBody() != null)
          PeamanText.body2(
            _getHeaderBody(),
          ),
        if (chat!.type == PeamanChatType.group)
          SizedBox(
            height: 15.h,
          ),
        if (chat!.type == PeamanChatType.group) _groupActionsBuilder(),
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
              size: 16.w,
            ),
            padding: EdgeInsets.all(9.w),
            bgColor: context.isDarkMode
                ? PeamanColors.containerBgDark
                : PeamanColors.secondary,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 0.0,
          ),
          title: PeamanText.subtitle1(
            'Media, links and files',
            style: TextStyle(fontSize: 14.sp),
          ),
          onTap: () {},
        ),
        if (chat!.type == PeamanChatType.oneToOne)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.group_add_rounded,
                color: PeamanColors.white,
                size: 16.w,
              ),
              padding: EdgeInsets.all(9.w),
              bgColor: context.isDarkMode
                  ? PeamanColors.containerBgDark
                  : PeamanColors.secondary,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: PeamanText.subtitle1(
              'Add to group',
              style: TextStyle(fontSize: 14.sp),
            ),
            onTap: () {},
          ),
        if (chat!.type == PeamanChatType.oneToOne)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.group,
                color: PeamanColors.white,
                size: 16.w,
              ),
              padding: EdgeInsets.all(9.w),
              bgColor: context.isDarkMode
                  ? PeamanColors.containerBgDark
                  : PeamanColors.secondary,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: PeamanText.subtitle1(
              'Groups in common',
              style: TextStyle(fontSize: 14.sp),
            ),
            onTap: () {},
          ),
        if (chat!.type == PeamanChatType.oneToOne)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.email_rounded,
                color: PeamanColors.white,
                size: 16.w,
              ),
              padding: EdgeInsets.all(9.w),
              bgColor: context.isDarkMode
                  ? PeamanColors.containerBgDark
                  : PeamanColors.secondary,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PeamanText.subtitle1(
                  'External contact',
                  style: TextStyle(fontSize: 14.sp),
                ),
                const PeamanText.body2(
                  'www.shrijanregmi.com',
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _chatActionsSet2Builder() {
    return Column(
      children: [
        SwitchListTile(
          value: true,
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
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
        if (chat!.type == PeamanChatType.oneToOne)
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
              'Block user',
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 0.0,
          ),
          title: PeamanText.subtitle1(
            'Clear messages',
            style: TextStyle(fontSize: 14.sp),
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
            style: TextStyle(fontSize: 14.sp),
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
          (failure) => 'Unknown',
        );
      },
      loading: () => 'Loading...',
      orElse: () => 'Unknown',
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
      loading: () => null,
      orElse: () => null,
    );
  }
}
