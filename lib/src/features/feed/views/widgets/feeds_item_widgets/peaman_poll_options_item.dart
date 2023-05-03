import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanPollOptionsItem extends HookConsumerWidget {
  final PeamanFeed feed;
  final PeamanPollOption option;
  final Function(PeamanFeed, PeamanPollOption)? onPressedOption;

  const PeamanPollOptionsItem({
    super.key,
    required this.feed,
    required this.option,
    this.onPressedOption,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var totalPopularity = 0;
    final popularity = option.popularity;
    for (var element in feed.pollOptions) {
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
                    width:
                        portion == 0 || feed.appUserSelectedPollOptionId == null
                            ? 0.0
                            : portion / 100 * availableWidth,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: feed.appUserSelectedPollOptionId == option.id
                          ? PeamanColors.lightGrey.withOpacity(0.9)
                          : PeamanColors.extraLightGrey,
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
              (option.option?.length ?? 0) > 25
                  ? '${option.option?.substring(0, 25) ?? ''}\n${option.option?.substring(25) ?? ''}'
                  : option.option,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (feed.appUserSelectedPollOptionId != null)
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
    ).onPressed(() => onPressedOption?.call(feed, option));
  }
}
