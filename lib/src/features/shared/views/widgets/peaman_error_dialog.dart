import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanErrorDialog extends ConsumerWidget {
  final PeamanError error;
  const PeamanErrorDialog({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Material(
        elevation: 2.0,
        color: PeamanColors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: PeamanText.body2(
                error.message,
                style: TextStyle(
                  color: PeamanColors.white,
                  fontSize: 12.sp,
                ),
              ).pX(15).pY(10),
            ),
            PeamanRoundIconButton(
              onPressed: () => context.pop(),
              padding: EdgeInsets.all(4.w),
              bgColor: PeamanColors.white,
              icon: Icon(
                Icons.close_rounded,
                size: 18.w,
                color: PeamanColors.red,
              ),
            ).pR(15),
          ],
        ),
      ).pad(20),
    );
  }
}
