import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PeamanFeedItemBodyYouTubeType extends ConsumerStatefulWidget {
  const PeamanFeedItemBodyYouTubeType({
    super.key,
    required this.feed,
  });

  final PeamanFeed feed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedItemBodyYouTubeTypeState();
}

class _PeamanFeedItemBodyYouTubeTypeState
    extends ConsumerState<PeamanFeedItemBodyYouTubeType> {
  @override
  Widget build(BuildContext context) {
    if (widget.feed.ytLink == null) return const SizedBox();

    final videoId = YoutubePlayer.convertUrlToId(widget.feed.ytLink!);
    final url = videoId == null
        ? null
        : YoutubePlayer.getThumbnail(
            videoId: videoId,
          );

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
      child: Align(
        alignment: Alignment.topLeft,
        child: Icon(
          Icons.play_arrow_rounded,
          color: context.isDarkMode ? PeamanColors.white70 : PeamanColors.white,
        ),
      ),
    ).pB(5.0).onPressed(
          () => context.pushNamed(
            PeamanViewMediasScreen.route,
            arguments: PeamanViewMediasScreenArgs(
              urls: [
                PeamanFileUrlExtended(
                  url: widget.feed.ytLink!,
                  type: PeamanFileType.video,
                  isLocal: false,
                ),
              ],
            ),
          ),
        );
  }
}
