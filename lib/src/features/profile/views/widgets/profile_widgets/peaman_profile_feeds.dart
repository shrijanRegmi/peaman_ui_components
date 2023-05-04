import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileFeeds extends ConsumerStatefulWidget {
  const PeamanProfileFeeds({
    super.key,
    required this.user,
  });

  final PeamanUser user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileFeedsState();
}

class _PeamanProfileFeedsState extends ConsumerState<PeamanProfileFeeds> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: PeamanNoGlowScrollConfiguration(),
      child: PeamanFeedsList.byFeedProivder(
        physics: const AlwaysScrollableScrollPhysics(),
        feedsProvider: (context, ref) => ref.watch(
          providerOfPeamanFeedsByOwnerId(widget.user.uid!),
        ),
      ),
    );
  }
}
