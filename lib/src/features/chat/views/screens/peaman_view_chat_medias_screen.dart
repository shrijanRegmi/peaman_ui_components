import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanViewChatMediasScreenArgs {
  final String chatId;

  const PeamanViewChatMediasScreenArgs({
    required this.chatId,
  });
}

class PeamanViewChatMediasScreen extends ConsumerStatefulWidget {
  final String chatId;

  const PeamanViewChatMediasScreen({
    super.key,
    required this.chatId,
  });

  static const route = '/peaman_view_chat_medias_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanViewChatMediasScreenState();
}

class _PeamanViewChatMediasScreenState
    extends ConsumerState<PeamanViewChatMediasScreen> {
  PeamanChat? get chat =>
      ref.watch(providerOfSinglePeamanChatFromChatsStream(widget.chatId));
  PeamanUser get appUser => ref.watch(providerOfLoggedInUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PeamanAppbar(
        title: 'Media, Links and Files',
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          _sentByFilterBuilder(),
          SizedBox(
            height: 20.h,
          ),
          _mediaTypeFilter(),
        ],
      ),
    );
  }

  Widget _sentByFilterBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PeamanText.body2(
          'Sent by'.toUpperCase(),
          style: TextStyle(
            color: PeamanColors.greyDark,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ).pL(20),
        PeamanUsersList.roundedByUids(
          usersIds: chat!.userIds,
          scrollDirection: Axis.horizontal,
          itemPadding: EdgeInsets.all(5.w),
          initialItemPadding: EdgeInsets.fromLTRB(20.w, 5.w, 5.w, 5.w),
          physics: const BouncingScrollPhysics(),
          nameBuilder: (user) => PeamanText.body2(
            appUser.uid == user.uid ? 'You' : user.name?.split(' ').first,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _mediaTypeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PeamanText.body2(
          'Type'.toUpperCase(),
          style: TextStyle(
            color: PeamanColors.greyDark,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ).pL(20),
        SizedBox(
          height: 5.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              PeamanChip(
                value: 'Photos',
                groupId: widget.chatId,
              ),
              SizedBox(
                width: 10.w,
              ),
              PeamanChip(
                value: 'Videos',
                groupId: widget.chatId,
              ),
              SizedBox(
                width: 10.w,
              ),
              PeamanChip(
                value: 'Links',
                groupId: widget.chatId,
              ),
              SizedBox(
                width: 10.w,
              ),
              PeamanChip(
                value: 'Files',
                groupId: widget.chatId,
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
