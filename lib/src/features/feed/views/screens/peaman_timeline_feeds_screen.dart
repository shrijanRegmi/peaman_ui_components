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
    return const Scaffold(
      appBar: PeamanTimelineHeader(),
      body: PeamanFeedsList(),
      floatingActionButton: PeamanFeedInitiatorButton(),
    );
  }
}
