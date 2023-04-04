import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

Future<T?> showPeamanConfirmationDialog<T>({
  required final BuildContext context,
  required final String title,
  required final Function() onConfirm,
  final String? description,
}) {
  return showCupertinoModalPopup<T>(
    context: context,
    builder: (context) {
      return PeamanConfirmationDialog(
        title: title,
        description: description,
        onConfirm: onConfirm,
      );
    },
  );
}

Future<T?> showNormalBottomsheet<T>({
  required final BuildContext context,
  required final Widget widget,
  final double borderRadius = 0.0,
}) {
  return showModalBottomSheet<T>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius.r),
        topRight: Radius.circular(borderRadius.r),
      ),
    ),
    builder: (context) => widget,
  );
}

Future<T?> showPeamanSelectableOptionsBottomsheet<T>({
  required final BuildContext context,
  required final List<PeamanSelectableOption> options,
  final Function(PeamanSelectableOption)? onSelectOption,
  final bool radio = true,
  final double borderRadius = 0.0,
  final int? activeIndex,
}) {
  return showNormalBottomsheet<T>(
    context: context,
    borderRadius: borderRadius,
    widget: PeamanSelectableOptionsBottomsheet(
      options: options,
      activeIndex: activeIndex,
      onSelectOption: onSelectOption,
      radio: radio,
    ),
  );
}
