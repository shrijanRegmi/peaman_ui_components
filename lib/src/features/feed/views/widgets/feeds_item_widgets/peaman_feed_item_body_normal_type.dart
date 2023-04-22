import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedItemBodyNormalType extends ConsumerStatefulWidget {
  const PeamanFeedItemBodyNormalType({
    super.key,
    required this.feed,
  });

  final PeamanFeed feed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedItemBodyNormalTypeState();
}

class _PeamanFeedItemBodyNormalTypeState
    extends ConsumerState<PeamanFeedItemBodyNormalType> {
  List<PeamanFileUrl> get _mediaFiles => widget.feed.files
      .where((element) =>
          element.type == PeamanFileType.image ||
          element.type == PeamanFileType.video)
      .toList();

  var _showAllImages = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_mediaFiles.isNotEmpty) _coverImgBuilder().pB(5),
        if (_mediaFiles.length > 1) _otherImagesGridBuilder().pB(10),
        if (widget.feed.caption?.isNotEmpty ?? false) _captionBuilder(),
      ],
    );
  }

  Widget _coverImgBuilder() {
    final file = widget.feed.files.first;
    final url =
        file.type == PeamanFileType.video ? file.thumbnailUrl : file.url;

    return Container(
      width: double.infinity,
      height: (ScreenUtil().screenWidth - 40.0),
      decoration: BoxDecoration(
        color: PeamanColors.extraLightGrey,
        borderRadius: BorderRadius.circular(10.r),
        image: url == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(url),
                fit: BoxFit.cover,
              ),
      ),
      padding: EdgeInsets.all(10.w),
      child: file.type == PeamanFileType.video
          ? const Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.play_arrow_rounded,
              ),
            )
          : null,
    );
  }

  Widget _otherImagesGridBuilder() {
    final trimmedMediaFiles = _mediaFiles.sublist(
      1,
      _mediaFiles.length > 7 && !_showAllImages ? 7 : _mediaFiles.length,
    );
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5.w,
        crossAxisSpacing: 5.w,
        childAspectRatio: 3 / 2,
      ),
      itemCount: trimmedMediaFiles.length,
      itemBuilder: (context, index) {
        final isMoreImagesAvailable =
            ((_mediaFiles.length - 1) > trimmedMediaFiles.length &&
                index == (trimmedMediaFiles.length - 1));

        final file = trimmedMediaFiles[index];
        final url =
            file.type == PeamanFileType.video ? file.thumbnailUrl : file.url;
        return Container(
          decoration: BoxDecoration(
            color: PeamanColors.extraLightGrey,
            borderRadius: BorderRadius.circular(10.r),
            image: url == null
                ? null
                : DecorationImage(
                    image: CachedNetworkImageProvider(url),
                    fit: BoxFit.cover,
                    colorFilter: !isMoreImagesAvailable
                        ? null
                        : ColorFilter.mode(
                            PeamanColors.black87.withOpacity(0.3),
                            BlendMode.darken,
                          ),
                  ),
          ),
          child: !isMoreImagesAvailable
              ? null
              : Stack(
                  children: [
                    if (file.type == PeamanFileType.video)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 16.w,
                        ),
                      ).pad(7),
                    Positioned.fill(
                      child: Center(
                        child: PeamanText.body2(
                          '+${(_mediaFiles.length - trimmedMediaFiles.length)}',
                          style: const TextStyle(
                            color: PeamanColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ).onPressed(
          () {
            if (isMoreImagesAvailable) {
              setState(() => _showAllImages = true);
            }
          },
        );
      },
    );
  }

  Widget _captionBuilder() {
    return Row(
      children: [
        Expanded(
          child: PeamanText.body1(
            widget.feed.caption,
            limit: 100,
            readMoreTextStyle: const TextStyle(
              color: PeamanColors.primary,
            ),
            withReadMore: true,
          ),
        ),
      ],
    );
  }
}
