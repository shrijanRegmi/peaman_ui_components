import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PeamanViewVideoMedia extends ConsumerStatefulWidget {
  final PeamanFileUrlExtended url;

  const PeamanViewVideoMedia({
    super.key,
    required this.url,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanViewVideoMediaState();
}

class _PeamanViewVideoMediaState extends ConsumerState<PeamanViewVideoMedia> {
  CachedVideoPlayerController? _videoController;
  YoutubePlayerController? _youtubeController;
  var isYoutubeVideo = false;

  @override
  void initState() {
    if (YoutubePlayer.convertUrlToId(widget.url.url) != null) {
      isYoutubeVideo = true;

      _youtubeController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url.url)!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          loop: true,
          hideControls: true,
        ),
      );
    } else {
      isYoutubeVideo = false;

      _videoController = CachedVideoPlayerController.network(
        widget.url.url,
        videoPlayerOptions: VideoPlayerOptions(),
      )
        ..initialize().then((_) => setState(() {}))
        ..play()
        ..setLooping(true);
    }

    super.initState();
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _youtubeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isYoutubeVideo ? _youtubeVideoBuilder() : _normalVideoBuilder(),
    );
  }

  Widget _normalVideoBuilder() {
    return AspectRatio(
      aspectRatio: _videoController!.value.aspectRatio,
      child: Stack(
        children: [
          PeamanSpinner(
            color:
                context.isDarkMode ? PeamanColors.white70 : PeamanColors.white,
          ),
          CachedVideoPlayer(_videoController!),
        ],
      ),
    );
  }

  Widget _youtubeVideoBuilder() {
    return YoutubePlayer(
      controller: _youtubeController!,
      aspectRatio: ScreenUtil().screenWidth / ScreenUtil().screenHeight,
      bufferIndicator: PeamanSpinner(
        color: context.isDarkMode ? PeamanColors.white70 : PeamanColors.white,
      ),
    );
  }
}
