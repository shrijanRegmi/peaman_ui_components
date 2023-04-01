import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanConfirmationDialog extends StatelessWidget {
  final String title;
  final String? description;
  final Function() onConfirm;
  const PeamanConfirmationDialog({
    super.key,
    required this.title,
    this.description,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (description != null)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Text(
                description!,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: PeamanColors.grey,
                ),
              ),
            ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Expanded(
                child: PeamanButton.bordered(
                  value: 'Cancel',
                  onPressed: () => context.pop(),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: PeamanButton.filled(
                  value: 'Confirm',
                  onPressed: () {
                    context.pop();
                    onConfirm();
                  },
                ),
              ),
            ],
          ),
        ],
      ).pad(15),
    );
  }
}
