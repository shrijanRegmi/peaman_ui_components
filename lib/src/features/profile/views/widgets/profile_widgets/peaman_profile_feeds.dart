import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileFeeds extends ConsumerStatefulWidget {
  const PeamanProfileFeeds({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileFeedsState();
}

class _PeamanProfileFeedsState extends ConsumerState<PeamanProfileFeeds> {
  @override
  Widget build(BuildContext context) {
    return const PeamanFeedsList(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
