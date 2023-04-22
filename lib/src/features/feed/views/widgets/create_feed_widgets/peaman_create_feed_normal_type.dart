import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCreateFeedNormalType extends ConsumerStatefulWidget {
  const PeamanCreateFeedNormalType({
    super.key,
    this.controller,
    this.inputBuilder,
    this.selectedFilesBuilder,
  });

  final TextEditingController? controller;

  final Widget Function(
    BuildContext,
    WidgetRef,
    TextEditingController,
  )? inputBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    List<PeamanFileUrlExtended>,
  )? selectedFilesBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanCreateFeedNormalTypeState();
}

class _PeamanCreateFeedNormalTypeState
    extends ConsumerState<PeamanCreateFeedNormalType> {
  PeamanCreateFeedProvider get _createFeedProvider =>
      ref.read(providerOfPeamanCreateFeed.notifier);
  List<PeamanFileUrlExtended> get selectedFiles => ref.watch(
        providerOfPeamanCreateFeed.select((value) => value.files),
      );
  TextEditingController get captionController => ref.watch(
        providerOfPeamanCreateFeed.select((value) => value.captionController),
      );

  @override
  Widget build(BuildContext context) {
    final selectedCaptionController = widget.controller ?? captionController;
    return Column(
      children: [
        widget.selectedFilesBuilder?.call(
              context,
              ref,
              selectedFiles,
            ) ??
            Column(
              children: [
                if (selectedFiles.isNotEmpty) _coverImgBuilder().pB(5.0),
                if (selectedFiles.length > 1)
                  _otherImagesListBuilder().pB(10.0),
              ],
            ),
        widget.inputBuilder?.call(
              context,
              ref,
              selectedCaptionController,
            ) ??
            TextFormField(
              minLines: 1,
              maxLines: 100,
              controller: selectedCaptionController,
              style: TextStyle(
                fontSize: 16.sp,
              ),
              onChanged: (val) {},
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'What do you want to talk about?',
              ),
            ),
      ],
    );
  }

  Widget _coverImgBuilder() {
    return Container(
      width: double.infinity,
      height: ScreenUtil().screenWidth - 40.0,
      decoration: BoxDecoration(
        color: PeamanColors.extraLightGrey,
        borderRadius: BorderRadius.circular(10.r),
        image: selectedFiles.first.thumbnailUrl == null
            ? null
            : DecorationImage(
                image: (selectedFiles.first.isLocal
                    ? FileImage(File(selectedFiles.first.thumbnailUrl!))
                    : CachedNetworkImageProvider(
                        selectedFiles.first.thumbnailUrl!,
                      )) as ImageProvider,
                fit: BoxFit.cover,
              ),
      ),
      padding: EdgeInsets.all(10.w),
      child: Align(
        alignment: Alignment.topRight,
        child: PeamanRoundIconButton(
          bgColor: PeamanColors.white,
          padding: EdgeInsets.all(6.w),
          icon: Icon(
            Icons.delete_rounded,
            size: 20.w,
            color: PeamanColors.red,
          ),
          onPressed: () => _createFeedProvider.removeFromFiles(
            selectedFiles.first,
          ),
        ),
      ),
    ).onPressed(
      () => _createFeedProvider.onPressedEditMedia(
        selectedFiles.first,
      ),
    );
  }

  Widget _otherImagesListBuilder() {
    final otherSelectedFiles = selectedFiles.sublist(1, selectedFiles.length);
    return SizedBox(
      height: 100.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: otherSelectedFiles.length,
        itemBuilder: (context, index) {
          final otherSelectedFile = otherSelectedFiles[index];
          return Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: PeamanColors.extraLightGrey,
              borderRadius: BorderRadius.circular(10.r),
              image: otherSelectedFile.thumbnailUrl == null
                  ? null
                  : DecorationImage(
                      image: (otherSelectedFile.isLocal
                          ? FileImage(File(otherSelectedFile.thumbnailUrl!))
                          : CachedNetworkImageProvider(
                              otherSelectedFile.thumbnailUrl!,
                            )) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
            ),
            padding: EdgeInsets.all(5.w),
            child: Align(
              alignment: Alignment.topRight,
              child: PeamanRoundIconButton(
                bgColor: PeamanColors.white,
                padding: EdgeInsets.all(5.w),
                icon: Icon(
                  Icons.delete_rounded,
                  size: 16.w,
                  color: PeamanColors.red,
                ),
                onPressed: () => _createFeedProvider.removeFromFiles(
                  otherSelectedFile,
                ),
              ),
            ),
          ).pR(5).onPressed(
                () => _createFeedProvider.onPressedEditMedia(
                  otherSelectedFile,
                ),
              );
        },
      ),
    );
  }
}
