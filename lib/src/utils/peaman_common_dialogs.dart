import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

Future<T?> showPeamanNormalBottomsheet<T>({
  required final BuildContext context,
  required final Widget widget,
  final double borderRadius = 15.0,
}) {
  return showModalBottomSheet<T>(
    context: context,
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

Future<T?> showPeamanLoadingDialog<T>({
  required final BuildContext context,
  final double borderRadius = 15.0,
  final bool barrierDismissible = false,
  final String loadingText = 'Loading...',
  final Widget? loadingWidget,
  final Widget? backIconWidget,
  final Function(Function())? onPressedBack,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) => WillPopScope(
      onWillPop: () async {
        context
          ..pop()
          ..pop();
        return false;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: context.theme.scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 250.w,
              ),
              padding: EdgeInsets.all(10.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      backIconWidget ??
                          PeamanRoundIconButton(
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              size: 16.w,
                            ),
                            padding: EdgeInsets.all(9.w),
                            onPressed: () {
                              if (onPressedBack != null) {
                                onPressedBack.call(() {
                                  context
                                    ..pop()
                                    ..pop();
                                });
                              } else {
                                context
                                  ..pop()
                                  ..pop();
                              }
                            },
                          ),
                    ],
                  ),
                  loadingWidget ??
                      const PeamanSpinner(
                        strokeWidth: 1.5,
                      ).pB(15),
                  PeamanText.subtitle1(loadingText).pB(20.0),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
