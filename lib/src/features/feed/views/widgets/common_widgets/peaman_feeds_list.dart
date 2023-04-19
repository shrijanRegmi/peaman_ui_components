import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedsList extends ConsumerStatefulWidget {
  const PeamanFeedsList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedsListState();
}

class _PeamanFeedsListState extends ConsumerState<PeamanFeedsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return const PeamanFeedsListItem();
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 0.0,
        );
      },
    );
  }
}
