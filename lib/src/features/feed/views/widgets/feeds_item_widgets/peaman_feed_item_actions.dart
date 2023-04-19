import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedItemActions extends ConsumerStatefulWidget {
  const PeamanFeedItemActions({
    super.key,
    required this.feedId,
  });

  final String feedId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedItemActionsState();
}

class _PeamanFeedItemActionsState extends ConsumerState<PeamanFeedItemActions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _actionButtonBuilder(
          svgPath: 'assets/svgs/outlined_comment.svg',
          count: 21,
        ),
        _actionButtonBuilder(
          svgPath: 'assets/svgs/outlined_love.svg',
          activeColor: PeamanColors.red80,
          count: 99,
        ),
        _actionButtonBuilder(
          svgPath: 'assets/svgs/outlined_bookmark.svg',
          count: 12,
          activeColor: PeamanColors.secondary,
          size: 18,
        ),
        _actionButtonBuilder(
          svgPath: 'assets/svgs/outlined_send_message.svg',
          count: 88,
          size: 15,
        ),
      ],
    );
  }

  Widget _actionButtonBuilder({
    required final String svgPath,
    required final int count,
    final double size = 16,
    final bool isActive = false,
    final Color? activeColor,
    final Function()? onPressed,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          isActive ? svgPath.replaceAll('outlined', 'filled') : svgPath,
          package: 'peaman_ui_components',
          width: size.w,
          color: isActive
              ? activeColor ?? PeamanColors.midLightGrey
              : PeamanColors.midLightGrey,
        ),
        SizedBox(
          width: 8.w,
        ),
        PeamanText.body2(
          count.toString(),
          style: TextStyle(
            fontSize: 11.sp,
          ),
        )
      ],
    ).onPressed(onPressed);
  }
}
