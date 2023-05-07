import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedItemBodyNormalType extends ConsumerStatefulWidget {
  const PeamanFeedItemBodyNormalType({
    super.key,
    required this.feed,
    this.coverImageBuilder,
    this.otherImagesBuilder,
    this.captionBuilder,
  });

  final PeamanFeed feed;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? coverImageBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? otherImagesBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? captionBuilder;

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
        if (_mediaFiles.isNotEmpty) _coverImgBuilder(),
        if (_mediaFiles.length > 1) _otherImagesGridBuilder(),
        if (widget.feed.caption?.isNotEmpty ?? false) _captionBuilder(),
      ],
    );
  }

  Widget _coverImgBuilder() {
    final file = widget.feed.files.first;
    final url =
        file.type == PeamanFileType.video ? file.thumbnailUrl : file.url;

    return widget.coverImageBuilder?.call(context, ref, widget.feed) ??
        Hero(
          tag: '$url',
          child: Container(
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
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: context.isDarkMode
                          ? PeamanColors.white70
                          : PeamanColors.white,
                    ),
                  )
                : null,
          ).pB(5.0).onPressed(
                () => context.pushNamed(
                  PeamanViewMediasScreen.route,
                  arguments: PeamanViewMediasScreenArgs(
                    urls: widget.feed.files,
                  ),
                ),
              ),
        );
  }

  Widget _otherImagesGridBuilder() {
    final trimmedMediaFiles = _mediaFiles.sublist(
      1,
      _mediaFiles.length > 7 && !_showAllImages ? 7 : _mediaFiles.length,
    );
    return widget.otherImagesBuilder?.call(context, ref, widget.feed) ??
        GridView.builder(
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
            final url = file.type == PeamanFileType.video
                ? file.thumbnailUrl
                : file.url;
            return Hero(
              tag: '$url',
              child: Container(
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
                padding: EdgeInsets.all(7.w),
                child: !isMoreImagesAvailable
                    ? file.type == PeamanFileType.video
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
                        : null
                    : Stack(
                        children: [
                          if (file.type == PeamanFileType.video)
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.play_arrow_rounded,
                                size: 16.w,
                                color: context.isDarkMode
                                    ? PeamanColors.white70
                                    : PeamanColors.white,
                              ),
                            ),
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
                  } else {
                    context.pushNamed(
                      PeamanViewMediasScreen.route,
                      arguments: PeamanViewMediasScreenArgs(
                        urls: widget.feed.files,
                        index: widget.feed.files
                            .indexWhere((element) => element.url == url),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ).pB(10.0);
  }

  Widget _captionBuilder() {
    return Row(
      children: [
        Expanded(
          child: widget.captionBuilder?.call(context, ref, widget.feed) ??
              PeamanText.body1(
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
