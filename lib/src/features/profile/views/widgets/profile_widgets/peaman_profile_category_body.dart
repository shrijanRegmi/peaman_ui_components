import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCategoryBody extends ConsumerStatefulWidget {
  const PeamanProfileCategoryBody({
    super.key,
    required this.user,
    this.allFeedsTabViewBuilder,
    this.imageFeedsTabViewBuilder,
    this.videoFeedsTabViewBuilder,
    this.youtubeFeedsTabViewBuilder,
    this.pollFeedsTabViewBuilder,
    this.aboutTabViewBuilder,
    this.tabViewsBuilder,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  final PeamanUser user;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? allFeedsTabViewBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? imageFeedsTabViewBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? videoFeedsTabViewBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? youtubeFeedsTabViewBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? pollFeedsTabViewBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? aboutTabViewBuilder;
  final List<Widget> Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? tabViewsBuilder;

  final ScrollPhysics physics;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileCategoryBodyState();
}

class _PeamanProfileCategoryBodyState
    extends ConsumerState<PeamanProfileCategoryBody> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: widget.physics,
      children: widget.tabViewsBuilder?.call(context, ref, widget.user) ??
          [
            widget.allFeedsTabViewBuilder?.call(context, ref, widget.user) ??
                PeamanProfileFeeds.all(
                  user: widget.user,
                ),
            widget.imageFeedsTabViewBuilder?.call(context, ref, widget.user) ??
                PeamanProfileFeeds.image(
                  user: widget.user,
                ),
            widget.videoFeedsTabViewBuilder?.call(context, ref, widget.user) ??
                PeamanProfileFeeds.video(
                  user: widget.user,
                ),
            widget.youtubeFeedsTabViewBuilder
                    ?.call(context, ref, widget.user) ??
                PeamanProfileFeeds.youtube(
                  user: widget.user,
                ),
            widget.pollFeedsTabViewBuilder?.call(context, ref, widget.user) ??
                PeamanProfileFeeds.poll(
                  user: widget.user,
                ),
            widget.aboutTabViewBuilder?.call(context, ref, widget.user) ??
                PeamanProfileAbout(
                  user: widget.user,
                ),
          ],
    );
  }
}
