import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

extension WidgetExt on Widget {
  Widget onPressed(final Function()? onPressed) => GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onPressedDown(final Function(TapDownDetails)? onPressed) =>
      GestureDetector(
        onTapDown: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onPressedUp(final Function(TapUpDetails)? onPressed) =>
      GestureDetector(
        onTapUp: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onLongPressed(final Function()? onLongPressed) => GestureDetector(
        onLongPress: onLongPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );

  Widget pX(double val) => Padding(
        padding: EdgeInsets.symmetric(horizontal: val.w),
        child: this,
      );

  Widget pY(double val) => Padding(
        padding: EdgeInsets.symmetric(vertical: val.h),
        child: this,
      );

  Widget pXY(double x, double y) => Padding(
        padding: EdgeInsets.symmetric(vertical: y.h, horizontal: x.w),
        child: this,
      );

  Widget pT(double val) => Padding(
        padding: EdgeInsets.only(top: val.h),
        child: this,
      );

  Widget pL(double val) => Padding(
        padding: EdgeInsets.only(left: val.w),
        child: this,
      );

  Widget pR(double val) => Padding(
        padding: EdgeInsets.only(right: val.w),
        child: this,
      );

  Widget pB(double val) => Padding(
        padding: EdgeInsets.only(bottom: val.h),
        child: this,
      );

  Widget pad(double val) => Padding(
        padding: EdgeInsets.all(val.w),
        child: this,
      );

  /// A wrapper for a widget, on pressing the widget, the keyboard will be dismissed.
  Widget keyboardDismisser(final BuildContext context) {
    return GestureDetector(
      onTap: () => context.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }
}
