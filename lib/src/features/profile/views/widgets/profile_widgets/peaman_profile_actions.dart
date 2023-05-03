import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileActions extends ConsumerWidget {
  const PeamanProfileActions({
    super.key,
    required this.user,
  });

  final PeamanUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PeamanButton.filled(
          value: 'Follow',
          minWidth: 130,
          borderRadius: 10.0,
          onPressed: () {},
        ),
        SizedBox(
          width: 6.w,
        ),
        PeamanButton.bordered(
          value: 'Message',
          borderRadius: 10.0,
          icon: SvgPicture.asset(
            'assets/svgs/outlined_send_message.svg',
            package: 'peaman_ui_components',
            color: context.isDarkMode
                ? PeamanColors.white70
                : context.theme.colorScheme.primary,
            width: 14.w,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: 5.w,
        ),
        PeamanButton.filled(
          minWidth: 0.0,
          borderRadius: 10.0,
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          color: PeamanColors.extraLightGrey.withOpacity(0.16),
          splashColor: PeamanColors.transparent,
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: context.isDarkMode
                ? PeamanColors.white70
                : context.theme.colorScheme.primary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
