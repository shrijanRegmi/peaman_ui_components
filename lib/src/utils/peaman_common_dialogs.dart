import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

Future<T?> showPeamanNormalBottomsheet<T>({
  required final BuildContext context,
  required final Widget widget,
  final double borderRadius = 15.0,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: context.theme.scaffoldBackgroundColor,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius.r),
        topRight: Radius.circular(borderRadius.r),
      ),
    ),
    builder: (context) => widget,
  );
}

Future<T?> showPeamanNormalDialog<T>({
  required final BuildContext context,
  required final Widget widget,
  final double borderRadius = 15.0,
}) {
  return showDialog<T>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      child: widget,
    ),
  );
}

Future<T?> showPeamanConfirmationDialog<T>({
  required final BuildContext context,
  required final String title,
  required final Function(BuildContext, WidgetRef) onConfirm,
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

Future<T?> showPeamanSelectableOptionsDialog<T>({
  required final BuildContext context,
  required final List<PeamanSelectableOption> Function(BuildContext, WidgetRef)
      optionsBuilder,
  final Function(BuildContext, WidgetRef, PeamanSelectableOption)?
      onSelectOption,
  final bool radio = true,
  final bool popNavigationOnSelect = true,
  final double borderRadius = 15.0,
  final int? activeIndex,
  final EdgeInsets? padding,
  final EdgeInsets? itemPadding,
}) {
  return showPeamanNormalDialog<T>(
    context: context,
    borderRadius: borderRadius,
    widget: PeamanSelectableOptionsBottomsheet(
      optionsBuilder: optionsBuilder,
      activeIndex: activeIndex,
      onSelectOption: onSelectOption,
      radio: radio,
      popNavigationOnSelect: popNavigationOnSelect,
      padding: padding,
      itemPadding: itemPadding,
    ),
  );
}

Future<T?> showPeamanSelectableOptionsBottomsheet<T>({
  required final BuildContext context,
  required final List<PeamanSelectableOption> Function(BuildContext, WidgetRef)
      optionsBuilder,
  final Function(BuildContext, WidgetRef, PeamanSelectableOption)?
      onSelectOption,
  final bool radio = true,
  final double borderRadius = 15.0,
  final int? activeIndex,
  final EdgeInsets? padding,
  final EdgeInsets? itemPadding,
}) {
  return showPeamanNormalBottomsheet<T>(
    context: context,
    borderRadius: borderRadius,
    widget: PeamanSelectableOptionsBottomsheet(
      optionsBuilder: optionsBuilder,
      activeIndex: activeIndex,
      onSelectOption: onSelectOption,
      radio: radio,
      padding: padding,
      itemPadding: itemPadding,
    ),
  );
}
