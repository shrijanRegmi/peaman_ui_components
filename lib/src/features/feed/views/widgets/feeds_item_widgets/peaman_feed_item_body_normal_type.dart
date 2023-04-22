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
  List<PeamanFileUrl> get _imageFiles => widget.feed.files
      .where((element) => element.type == PeamanFileType.image)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_imageFiles.isNotEmpty) _coverImgBuilder().pB(5),
        if (_imageFiles.length > 1) _otherImagesGridBuilder().pB(10),
        if (widget.feed.caption?.isNotEmpty ?? false) _captionBuilder(),
      ],
    );
  }

  Widget _coverImgBuilder() {
    return Container(
      width: double.infinity,
      height: (ScreenUtil().screenWidth - 40.0),
      decoration: BoxDecoration(
        color: PeamanColors.extraLightGrey,
        borderRadius: BorderRadius.circular(10.r),
        image: widget.feed.files.first.url == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(
                  widget.feed.files.first.url!,
                ),
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Widget _otherImagesGridBuilder() {
    final trimmedImageFiles =
        _imageFiles.sublist(0, _imageFiles.length > 6 ? 6 : _imageFiles.length);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5.w,
        crossAxisSpacing: 5.w,
        childAspectRatio: 3 / 2,
      ),
      itemCount: trimmedImageFiles.length,
      itemBuilder: (context, index) {
        final isMoreMediaAvailable =
            (_imageFiles.length > trimmedImageFiles.length &&
                index == (trimmedImageFiles.length - 1));

        final imageFile = trimmedImageFiles[index];
        return Container(
          decoration: BoxDecoration(
            color: PeamanColors.extraLightGrey,
            borderRadius: BorderRadius.circular(10.r),
            image: imageFile.url == null
                ? null
                : DecorationImage(
                    image: CachedNetworkImageProvider(
                      imageFile.url!,
                    ),
                    fit: BoxFit.cover,
                    colorFilter: !isMoreMediaAvailable
                        ? null
                        : ColorFilter.mode(
                            PeamanColors.black87.withOpacity(0.3),
                            BlendMode.darken,
                          ),
                  ),
          ),
          child: !isMoreMediaAvailable
              ? null
              : Center(
                  child: PeamanText.body2(
                    '+${(_imageFiles.length - trimmedImageFiles.length) + 1}',
                    style: const TextStyle(
                      color: PeamanColors.white,
                    ),
                  ),
                ),
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
            withReadMore: true,
          ),
        ),
      ],
    );
  }
}
