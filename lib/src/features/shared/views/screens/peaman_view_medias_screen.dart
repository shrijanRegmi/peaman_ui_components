import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PeamanViewMediasScreenArgs {
  final List<PeamanFileUrlExtended> urls;
  final int index;

  const PeamanViewMediasScreenArgs({
    required this.urls,
    this.index = 0,
  });
}

class PeamanViewMediasScreen extends StatefulHookConsumerWidget {
  final List<PeamanFileUrlExtended> urls;
  final int index;

  const PeamanViewMediasScreen({
    super.key,
    required this.urls,
    this.index = 0,
  });

  static const route = '/peaman_view_medias_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanViewMediasScreenState();
}

class _PeamanViewMediasScreenState
    extends ConsumerState<PeamanViewMediasScreen> {
  var _isActionButtonsVisible = true;
  var _activeIndex = 0;

  @override
  void initState() {
    _activeIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(
      initialPage: widget.index,
    );

    return Scaffold(
      backgroundColor: PeamanColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _backButtonBuilder().pad(10),
            Expanded(
              child: PeamanViewMediasList(
                urls: widget.urls,
                index: widget.index,
                pageController: pageController,
                onPageChanged: (val) => setState(() => _activeIndex = val),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            _otherMediasBuilder(pageController).pL(10),
            SizedBox(
              height: 10.h,
            ),
          ],
        ).onPressed(
          () => setState(
            () => _isActionButtonsVisible = !_isActionButtonsVisible,
          ),
        ),
      ),
    );
  }

  Widget _backButtonBuilder() {
    return AnimatedOpacity(
      opacity: _isActionButtonsVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: PeamanRoundIconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: context.isDarkMode ? PeamanColors.white70 : PeamanColors.white,
        ),
        onPressed: context.pop,
      ),
    );
  }

  Widget _otherMediasBuilder(final PageController pageController) {
    final urls = widget.urls;

    return AnimatedOpacity(
      opacity: _isActionButtonsVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: SizedBox(
        height: 60.w,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: urls.length,
          itemBuilder: (context, index) {
            final file = urls[index];
            var url = file.type == PeamanFileType.video
                ? file.thumbnailUrl
                : file.url;

            final youtubeUrl = YoutubePlayer.convertUrlToId(file.url);
            if (youtubeUrl != null) {
              url = YoutubePlayer.getThumbnail(
                videoId: youtubeUrl,
              );
            }

            return Container(
              width: 80.w,
              decoration: BoxDecoration(
                color: PeamanColors.extraLightGrey,
                borderRadius: BorderRadius.circular(8.r),
                border: _activeIndex == index
                    ? Border.all(
                        color: context.isDarkMode
                            ? PeamanColors.white70
                            : PeamanColors.white,
                        width: 1.5,
                      )
                    : null,
                image: url == null
                    ? null
                    : DecorationImage(
                        image: CachedNetworkImageProvider(url),
                        fit: BoxFit.cover,
                      ),
              ),
              padding: EdgeInsets.all(7.w),
              child: file.type == PeamanFileType.video
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
                  : null,
            ).pR(5.0).onPressed(() {
              pageController.animateTo(
                ScreenUtil().screenWidth * index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            });
          },
        ),
      ),
    );
  }
}
