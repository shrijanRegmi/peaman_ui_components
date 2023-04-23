import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedItemBody extends ConsumerStatefulWidget {
  const PeamanFeedItemBody({
    super.key,
    required this.feed,
    this.normalTypeBuilder,
    this.youTubeTypeBuilder,
    this.pollTypeBuilder,
    this.defaultTypeBuilder,
  });

  final PeamanFeed feed;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? normalTypeBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? youTubeTypeBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? pollTypeBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? defaultTypeBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedItemBodyState();
}

class _PeamanFeedItemBodyState extends ConsumerState<PeamanFeedItemBody> {
  @override
  Widget build(BuildContext context) {
    switch (widget.feed.type) {
      case PeamanFeedType.text:
        return widget.normalTypeBuilder?.call(context, ref, widget.feed) ??
            PeamanFeedItemBodyNormalType(
              feed: widget.feed,
            );
      case PeamanFeedType.file:
        return widget.normalTypeBuilder?.call(context, ref, widget.feed) ??
            PeamanFeedItemBodyNormalType(
              feed: widget.feed,
            );
      case PeamanFeedType.youTube:
        return widget.normalTypeBuilder?.call(context, ref, widget.feed) ??
            PeamanFeedItemBodyYouTubeType(
              feed: widget.feed,
            );
      case PeamanFeedType.poll:
        return widget.normalTypeBuilder?.call(context, ref, widget.feed) ??
            PeamanFeedItemBodyPollType(
              feed: widget.feed,
            );
      default:
        return widget.defaultTypeBuilder?.call(context, ref, widget.feed) ??
            const SizedBox();
    }
  }
}
