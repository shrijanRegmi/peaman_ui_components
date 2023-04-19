import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedsListItem extends ConsumerStatefulWidget {
  const PeamanFeedsListItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedsListItemState();
}

class _PeamanFeedsListItemState extends ConsumerState<PeamanFeedsListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PeamanFeedItemHeader(feedId: ''),
        SizedBox(
          height: 15.h,
        ),
        const PeamanFeedItemBody(feedId: ''),
        SizedBox(
          height: 20.h,
        ),
        const PeamanFeedItemActions(feedId: ''),
        SizedBox(
          height: 10.h,
        ),
      ],
    ).pX(20.0).pY(15.0);
  }
}
