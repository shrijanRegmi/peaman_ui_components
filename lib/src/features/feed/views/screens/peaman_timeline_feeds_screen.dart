import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanTimelineFeedsScreen extends ConsumerStatefulWidget {
  const PeamanTimelineFeedsScreen({super.key});

  static const route = '/peaman_timeline_feeds_screen';

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
      appBar: const PeamanTimelineHeader(),
      body: RefreshIndicator(
        onRefresh: () async =>
            ref.invalidate(providerOfPeamanTimelineFeedsFuture),
        child: const PeamanFeedsList(),
      ),
      floatingActionButton: const PeamanFeedInitiatorButton(),
    );
  }
}
