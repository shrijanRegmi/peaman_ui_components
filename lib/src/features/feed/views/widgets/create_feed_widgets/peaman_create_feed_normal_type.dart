import 'dart:io';

import 'package:flutter/material.dart';
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
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: PeamanColors.transparent,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: PeamanColors.transparent,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: PeamanColors.transparent,
                  ),
                ),
                contentPadding: const EdgeInsets.all(0.0),
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                ),
                filled: false,
                hintText: 'What do you want to talk about?',
              ),
            ),
      ],
    );
  }

  Widget _coverImgBuilder() {
    final file = selectedFiles.first;
    final url =
        file.type == PeamanFileType.video ? file.thumbnailUrl : file.url;

    return Container(
      width: double.infinity,
      height: ScreenUtil().screenWidth - 40.0,
      decoration: BoxDecoration(
        color: PeamanColors.extraLightGrey,
        borderRadius: BorderRadius.circular(10.r),
        image: url == null
            ? null
            : DecorationImage(
                image: (file.isLocal
                    ? FileImage(File(url))
                    : CachedNetworkImageProvider(url)) as ImageProvider,
                fit: BoxFit.cover,
              ),
      ),
      padding: EdgeInsets.all(10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          file.type == PeamanFileType.video
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: context.isDarkMode
                        ? PeamanColors.white70
                        : PeamanColors.white,
                  ),
                )
              : const SizedBox(),
          PeamanRoundIconButton(
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
        ],
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
          final file = otherSelectedFiles[index];
          final url =
              file.type == PeamanFileType.video ? file.thumbnailUrl : file.url;
          return Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: PeamanColors.extraLightGrey,
              borderRadius: BorderRadius.circular(10.r),
              image: url == null
                  ? null
                  : DecorationImage(
                      image: (file.isLocal
                          ? FileImage(File(url))
                          : CachedNetworkImageProvider(url)) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
            ),
            padding: EdgeInsets.all(5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                file.type == PeamanFileType.video
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 16.w,
                          color: context.isDarkMode
                              ? PeamanColors.white70
                              : PeamanColors.white,
                        ),
                      )
                    : const SizedBox(),
                PeamanRoundIconButton(
                  bgColor: PeamanColors.white,
                  padding: EdgeInsets.all(5.w),
                  icon: Icon(
                    Icons.delete_rounded,
                    size: 16.w,
                    color: PeamanColors.red,
                  ),
                  onPressed: () => _createFeedProvider.removeFromFiles(file),
                ),
              ],
            ),
          ).pR(5).onPressed(
                () => _createFeedProvider.onPressedEditMedia(file),
              );
        },
      ),
    );
  }
}
