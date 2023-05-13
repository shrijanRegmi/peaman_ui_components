import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PeamanCreateFeedYouTubeType extends ConsumerStatefulWidget {
  const PeamanCreateFeedYouTubeType({
    super.key,
    this.controller,
    this.inputBuilder,
  });

  final TextEditingController? controller;

  final Widget Function(
    BuildContext,
    WidgetRef,
    TextEditingController,
  )? inputBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      PeamanCreateFeedYouTubeTypeState();
}

class PeamanCreateFeedYouTubeTypeState
    extends ConsumerState<PeamanCreateFeedYouTubeType> {
  TextEditingController get _youtubeLinkController => ref.watch(
        providerOfPeamanCreateFeed.select(
          (value) => value.youtubeLinkController,
        ),
      );
  TextEditingController get _selectedYoutubeLinkController =>
      widget.controller ?? _youtubeLinkController;

  String? _youtubeVideoId;
  var _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _inputBuilder(),
        SizedBox(
          height: 10.h,
        ),
        if (_isTyping) _outputBuilder(),
      ],
    );
  }

  Widget _inputBuilder() {
    return widget.inputBuilder?.call(
          context,
          ref,
          _selectedYoutubeLinkController,
        ) ??
        TextFormField(
          minLines: 1,
          maxLines: 100,
          controller: _selectedYoutubeLinkController,
          style: TextStyle(
            fontSize: 16.sp,
          ),
          onChanged: (val) {
            if (val.isEmpty) {
              setState(() {
                _isTyping = false;
                _youtubeVideoId = null;
              });
            } else {
              setState(() {
                _isTyping = true;
                _youtubeVideoId = YoutubePlayer.convertUrlToId(val);
              });
            }
          },
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
            hintText: 'What do you want to share from YouTube?',
          ),
        );
  }

  Widget _outputBuilder() {
    final youtubeUrl = YoutubePlayer.getThumbnail(
      videoId: _youtubeVideoId ?? '',
    );
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        color: PeamanColors.extraLightGrey,
        borderRadius: BorderRadius.circular(10.r),
        image: _youtubeVideoId == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(youtubeUrl),
                fit: BoxFit.cover,
              ),
      ),
      padding: EdgeInsets.all(10.w),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.play_arrow_rounded,
              color: _youtubeVideoId == null
                  ? PeamanColors.black
                  : context.isDarkMode
                      ? PeamanColors.white70
                      : PeamanColors.white,
            ),
          ),
          if (_youtubeVideoId == null)
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const PeamanText.body1(
                      'Invalid youtube url',
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
