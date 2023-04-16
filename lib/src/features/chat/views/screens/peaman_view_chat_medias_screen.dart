import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PeamanAppbar(
        title: 'Media, Links and Files',
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
        SizedBox(
          height: 10.h,
        ),
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
          userIds: chat!.userIds,
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

  Widget _mediaGridBuilder() {
    final chatFilesStream = ref.watch(
      providerOfPeamanChatFilesStream(widget.chatId),
    );

    return SliverPadding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        bottom: 50.w,
      ),
      sliver: chatFilesStream.maybeWhen(
        data: (data) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final itemIndex = index ~/ 2;
                final chatFile = data[itemIndex];

                if (index.isEven) {
                  return Column(
                    children: [
                      if (index == 0)
                        PeamanDateDivider(
                          date: DateTime.fromMillisecondsSinceEpoch(
                            chatFile.createdAt!,
                          ),
                          withTime: true,
                        ),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: chatFile.urls.length,
                        itemBuilder: (context, index) {
                          final url = chatFile.urls[index];
                          return Container(
                            width: 200.w,
                            height: 200.h,
                            decoration: BoxDecoration(
                              color: PeamanColors.extraLightGrey,
                              borderRadius: BorderRadius.circular(5.r),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  url.url ?? '',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ).onPressed(
                            () => context.pushNamed(
                              PeamanViewPicturesScreen.route,
                              arguments: PeamanViewPicturesArgs(
                                pictures: chatFile.urls
                                    .map((e) => e.url ?? '')
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }

                return PeamanDateDivider(
                  date: DateTime.fromMillisecondsSinceEpoch(
                    chatFile.createdAt!,
                  ),
                  withTime: true,
                );
              },
              childCount: max(0, data.length * 2 - 1),
              semanticIndexCallback: (Widget widget, int localIndex) {
                if (localIndex.isEven) {
                  return localIndex ~/ 2;
                }
                return null;
              },
            ),
          );
        },
        loading: () => const SliverToBoxAdapter(
          child: PeamanSpinner(),
        ),
        orElse: () => const SliverToBoxAdapter(
          child: SizedBox(),
        ),
      ),
    );
  }
}
