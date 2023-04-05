import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

Future<T?> showPeamanChatUserInfoDialog<T>({
  required final BuildContext context,
  final Function(PeamanSelectableOption)? onSelectOption,
}) {
  return showPeamanSelectableOptionsDialog<T>(
    context: context,
    borderRadius: 15.0,
    radio: false,
    itemPadding: EdgeInsets.symmetric(
      horizontal: 30.w,
      vertical: 0,
    ),
    padding: EdgeInsets.symmetric(vertical: 10.h),
    onSelectOption: onSelectOption,
    options: [
      PeamanSelectableOption(
        id: 0,
        leading: PeamanRoundIconButton(
          icon: Icon(
            Icons.send,
            color: PeamanColors.white,
            size: 12.w,
          ),
          padding: EdgeInsets.all(7.w),
          bgColor: context.theme.colorScheme.primary,
        ),
        title: 'Send message',
      ),
      PeamanSelectableOption(
        id: 1,
        leading: PeamanRoundIconButton(
          icon: Icon(
            Icons.person_rounded,
            color: PeamanColors.white,
            size: 12.w,
          ),
          padding: EdgeInsets.all(7.w),
          bgColor: context.theme.colorScheme.primary,
        ),
        title: 'View profile',
      ),
      PeamanSelectableOption(
        id: 2,
        leading: PeamanRoundIconButton(
          icon: Icon(
            Icons.group_add_rounded,
            color: PeamanColors.white,
            size: 12.w,
          ),
          padding: EdgeInsets.all(7.w),
          bgColor: context.theme.colorScheme.primary,
        ),
        title: 'Add to group',
      ),
    ],
  );
}
