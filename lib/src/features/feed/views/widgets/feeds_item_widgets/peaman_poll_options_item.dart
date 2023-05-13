import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanPollOptionsItem extends ConsumerStatefulWidget {
  final PeamanFeed feed;
  final PeamanPollOption option;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    PeamanPollOption,
    Function(),
  )? onPressedOption;

  const PeamanPollOptionsItem({
    super.key,
    required this.feed,
    required this.option,
    this.onPressedOption,
  });

  @override
  ConsumerState<PeamanPollOptionsItem> createState() =>
      _PeamanPollOptionsItemState();
}

class _PeamanPollOptionsItemState extends ConsumerState<PeamanPollOptionsItem> {
  @override
  Widget build(
    BuildContext context,
  ) {
    var totalPopularity = 0;
    final popularity = widget.option.popularity;
    for (var element in widget.feed.pollOptions) {
      totalPopularity += element.popularity;
    }

    final portion =
        totalPopularity == 0 ? 0.0 : popularity / totalPopularity * 100.0;

    return Stack(
      children: [
        Container(
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: PeamanColors.lightGrey,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final availableWidth = constraints.maxWidth;
              return Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: portion == 0 ||
                            widget.feed.appUserSelectedPollOptionId == null
                        ? 0.0
                        : portion / 100 * availableWidth,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.feed.appUserSelectedPollOptionId ==
                              widget.option.id
                          ? PeamanColors.lightGrey.withOpacity(0.7)
                          : PeamanColors.extraLightGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14.r),
                        bottomLeft: Radius.circular(14.r),
                        topRight: Radius.circular(
                          portion == 100.0 ? 14.r : 12.r,
                        ),
                        bottomRight: Radius.circular(
                          portion == 100.0 ? 14.r : 12.r,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Positioned.fill(
          child: Center(
            child: PeamanText.body2(
              (widget.option.option?.length ?? 0) > 25
                  ? '${widget.option.option?.substring(0, 25) ?? ''}\n${widget.option.option?.substring(25) ?? ''}'
                  : widget.option.option,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (widget.feed.appUserSelectedPollOptionId != null)
          Positioned.fill(
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                PeamanText.body2(
                  '${portion.toStringAsFixed(1)}%',
                  style: TextStyle(
                    color: PeamanColors.grey,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
      ],
    ).onPressed(() {
      if (widget.onPressedOption != null) {
        widget.onPressedOption?.call(
          context,
          ref,
          widget.feed,
          widget.option,
          _onPressedOption,
        );
      } else {
        _onPressedOption();
      }
    });
  }

  void _onPressedOption() {
    ref.read(providerOfPeamanFeed.notifier).choosePollOption(
          feedId: widget.feed.id!,
          options: widget.feed.pollOptions,
          optionId: widget.option.id!,
        );
  }
}
