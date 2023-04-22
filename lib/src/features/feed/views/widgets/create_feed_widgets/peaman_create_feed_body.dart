import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCreateFeedBody extends ConsumerStatefulWidget {
  const PeamanCreateFeedBody({
    super.key,
    this.feedType,
    this.mediaTypeBuilder,
    this.youTubeTypeBuilder,
    this.pollTypeBuilder,
  });

  final PeamanFeedType? feedType;

  final Widget Function(
    BuildContext,
    WidgetRef,
  )? mediaTypeBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? youTubeTypeBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? pollTypeBuilder;

  @override
  ConsumerState<PeamanCreateFeedBody> createState() =>
      _PeamanCreateFeedBodyState();
}

class _PeamanCreateFeedBodyState extends ConsumerState<PeamanCreateFeedBody> {
  @override
  Widget build(BuildContext context) {
    final selectedFeedType = widget.feedType ??
        ref.watch(
          providerOfPeamanCreateFeed.select((value) => value.feedType),
        );
    switch (selectedFeedType) {
      case PeamanFeedType.text:
        return widget.mediaTypeBuilder?.call(context, ref) ??
            const PeamanCreateFeedNormalType();
      case PeamanFeedType.file:
        return widget.mediaTypeBuilder?.call(context, ref) ??
            const PeamanCreateFeedNormalType();
      case PeamanFeedType.youTube:
        return widget.youTubeTypeBuilder?.call(context, ref) ??
            const PeamanCreateFeedYouTubeType();
      case PeamanFeedType.poll:
        return widget.pollTypeBuilder?.call(context, ref) ??
            const PeamanCreateFeedPollType().pT(10.0);
      default:
        return const SizedBox();
    }
  }
}
