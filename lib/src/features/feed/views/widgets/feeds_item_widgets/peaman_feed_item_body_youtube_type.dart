import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

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
    return Container();
  }
}
