import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanViewChatMediasFilesLinksScreenArgs {
  final String chatId;

  const PeamanViewChatMediasFilesLinksScreenArgs({
    required this.chatId,
  });
}

class PeamanViewChatMediasFilesLinksScreen extends ConsumerStatefulWidget {
  final String chatId;

  const PeamanViewChatMediasFilesLinksScreen({
    super.key,
    required this.chatId,
  });

  static const route = '/peaman_view_chat_medias_files_links_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanViewChatMediasFilesLinksScreenState();
}

class _PeamanViewChatMediasFilesLinksScreenState
    extends ConsumerState<PeamanViewChatMediasFilesLinksScreen> {
  PeamanChat? get chat =>
      ref.watch(providerOfSinglePeamanChatFromChatsStream(widget.chatId));
  PeamanUser get appUser => ref.watch(providerOfLoggedInUser);

  final _selectedUsers = <PeamanUser>[];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _clearSelectedFileType();
        return true;
      },
      child: Scaffold(
        appBar: PeamanAppbar(
          titleText: 'Media, Links and Files',
          onPressedLeading: (def) {
            _clearSelectedFileType();
            def();
          },
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: _filtersBuilder(),
            ),
            _mediaGridBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _filtersBuilder() {
    return Column(
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
          userIds: List<String>.from(chat!.activeUserIds)
            ..sort((a, b) {
              if (appUser.uid == a) return 1;
              return -1;
            })
            ..sort((a, b) {
              if (_selectedUsers.map((e) => e.uid).contains(a)) return -1;
              return 1;
            }),
          scrollDirection: Axis.horizontal,
          itemPadding: EdgeInsets.all(5.w),
          firstItemPadding: EdgeInsets.fromLTRB(20.w, 5.w, 5.w, 5.w),
          physics: const BouncingScrollPhysics(),
          nameBuilder: (context, ref, user) => PeamanText.body2(
            appUser.uid == user.uid ? 'You' : user.name?.split(' ').first,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          avatarBuilder: (context, ref, user) => PeamanAvatarBuilder.network(
            user.photo,
            isSelected: _selectedUsers.map((e) => e.uid).contains(user.uid),
          ),
          onPressedUser: (context, ref, user) {
            if (_selectedUsers.map((e) => e.uid).contains(user.uid)) {
              setState(() {
                _selectedUsers
                    .removeWhere((element) => element.uid == user.uid);
              });
            } else {
              setState(() {
                _selectedUsers.add(user);
              });
            }
          },
        ),
      ],
    );
  }

  Widget _mediaTypeFilter() {
    return SizedBox(
      width: double.infinity,
      child: Column(
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
      ),
    );
  }

  Widget _mediaGridBuilder() {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        bottom: 50.w,
      ),
      sliver: PeamanChatFilesList(
        chatId: widget.chatId,
        urlsFilterBuilder: (context, ref, chatFileUrls) {
          final chipsState = ref.watch(providerOfPeamanChip);
          final selectedTypeString = chipsState[widget.chatId] ?? '';

          var selectedFileType = PeamanFileType.unknown;
          switch (selectedTypeString) {
            case 'Photos':
              selectedFileType = PeamanFileType.image;
              break;
            case 'Videos':
              selectedFileType = PeamanFileType.video;
              break;
            case 'Links':
              selectedFileType = PeamanFileType.link;
              break;
            case 'Files':
              selectedFileType = PeamanFileType.other;
              break;
            default:
          }

          if (selectedFileType == PeamanFileType.unknown) return chatFileUrls;
          return chatFileUrls
              .where((element) => element.type == selectedFileType)
              .toList();
        },
        filterBuilder: (context, ref, chatFiles) {
          if (_selectedUsers.isEmpty) return chatFiles;
          return chatFiles
              .where(
                (element) =>
                    _selectedUsers.map((e) => e.uid).contains(element.ownerId),
              )
              .toList();
        },
      ),
    );
  }

  void _clearSelectedFileType() {
    ref.read(providerOfPeamanChip.notifier).clearGroup(groupId: widget.chatId);
  }
}
