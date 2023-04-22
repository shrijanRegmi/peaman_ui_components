import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/feed/views/widgets/feeds_item_widgets/peaman_poll_options_item.dart';
import 'package:timeago/timeago.dart' as timeago;

class PeamanFeedItemBodyPollType extends ConsumerStatefulWidget {
  const PeamanFeedItemBodyPollType({
    super.key,
    required this.feed,
  });

  final PeamanFeed feed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedItemBodyPollTypeState();
}

class _PeamanFeedItemBodyPollTypeState
    extends ConsumerState<PeamanFeedItemBodyPollType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: PeamanColors.extraLightGrey,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.all(15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PeamanFeedItemHeader(
            feed: widget.feed,
          ),
          SizedBox(
            height: 30.h,
          ),
          _pollQuestionBuilder(),
          SizedBox(
            height: 20.h,
          ),
          for (var i = 0; i < widget.feed.pollOptions.length; i++)
            PeamanPollOptionsItem(
              feed: widget.feed,
              option: widget.feed.pollOptions[i],
              onPressedOption: (f, o) {},
            ).pB(i == (widget.feed.pollOptions.length - 1) ? 5.0 : 20)
        ],
      ),
    );
  }

  Widget _pollQuestionBuilder() {
    return PeamanText.subtitle1(
      widget.feed.pollQuestion ?? 'Not Available',
    );
  }

  Widget _dateBuilder() {
    return Text(
      timeago.format(
        DateTime.fromMillisecondsSinceEpoch(
          widget.feed.createdAt!,
        ),
      ),
      style: TextStyle(
        fontSize: 10.sp,
      ),
    );
  }
}
