import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanTimelineFeedsScreen extends ConsumerStatefulWidget {
  const PeamanTimelineFeedsScreen({
    super.key,
    this.headerBuilder,
    this.feedsListBuilder,
    this.feedInitiatorButtonBuilder,
  });

  static const route = '/peaman_timeline_feeds_screen';

  final PreferredSizeWidget Function(BuildContext, WidgetRef)? headerBuilder;
  final Widget Function(BuildContext, WidgetRef)? feedsListBuilder;
  final Widget Function(BuildContext, WidgetRef)? feedInitiatorButtonBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanTimelineFeedsScreenState();
}

class _PeamanTimelineFeedsScreenState
    extends ConsumerState<PeamanTimelineFeedsScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(providerOfPeamanFeed, (previous, next) {
      if (previous?.createFeedState != next.createFeedState) {
        next.createFeedState.maybeWhen(
          success: (_) => ref.invalidate(providerOfPeamanCreateFeed),
          orElse: () {},
        );
      }
      if (previous?.updateFeedState != next.updateFeedState) {
        next.updateFeedState.maybeWhen(
          success: (_) => ref.invalidate(providerOfPeamanCreateFeed),
          orElse: () {},
        );
      }
    });

    return Scaffold(
      appBar: widget.headerBuilder?.call(context, ref) ??
          const PeamanTimelineHeader(),
      body: widget.feedsListBuilder?.call(context, ref) ??
          RefreshIndicator(
            onRefresh: () async => ref.invalidate(
              providerOfPeamanTimelineFeedsFuture,
            ),
            child: const PeamanFeedsList(),
          ),
      floatingActionButton:
          widget.feedInitiatorButtonBuilder?.call(context, ref) ??
              const PeamanFeedInitiatorButton(),
    );
  }
}
