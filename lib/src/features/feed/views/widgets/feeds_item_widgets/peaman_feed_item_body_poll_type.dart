import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedItemBodyPollType extends ConsumerStatefulWidget {
  const PeamanFeedItemBodyPollType({
    super.key,
    required this.feed,
    this.headerBuilder,
    this.questionBuilder,
    this.optionsListBuilder,
    this.optionsListItemBuilder,
  });

  final PeamanFeed feed;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? headerBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? questionBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    List<PeamanPollOption>,
  )? optionsListBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    PeamanPollOption,
  )? optionsListItemBuilder;

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
          widget.headerBuilder?.call(context, ref, widget.feed) ??
              PeamanFeedItemHeader(
                feed: widget.feed,
              ).pB(30.0),
          _pollQuestionBuilder(),
          widget.optionsListBuilder?.call(
                context,
                ref,
                widget.feed,
                widget.feed.pollOptions,
              ) ??
              Column(
                children: [
                  for (var i = 0; i < widget.feed.pollOptions.length; i++)
                    widget.optionsListItemBuilder?.call(
                          context,
                          ref,
                          widget.feed,
                          widget.feed.pollOptions[i],
                        ) ??
                        PeamanPollOptionsItem(
                          feed: widget.feed,
                          option: widget.feed.pollOptions[i],
                          onPressedOption: (f, o) {},
                        ).pB(
                          i == (widget.feed.pollOptions.length - 1) ? 5.0 : 20,
                        )
                ],
              )
        ],
      ),
    );
  }

  Widget _pollQuestionBuilder() {
    return widget.questionBuilder?.call(context, ref, widget.feed) ??
        PeamanText.subtitle1(
          widget.feed.pollQuestion ?? 'Not Available',
        ).pB(20.0);
  }
}
