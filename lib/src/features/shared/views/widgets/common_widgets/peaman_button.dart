import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  filled,
  bordered,
}

class PeamanButton extends StatelessWidget {
  final _Type _type;

  final String? value;
  final TextStyle? valueStyle;
  final Color? color;
  final Color? splashColor;
  final BorderSide? borderSide;

  final Widget? icon;
  final double? width;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double elevation;
  final bool isLoading;
  final Widget? loader;
  final Function()? onPressed;

  const PeamanButton.filled({
    super.key,
    this.value,
    this.valueStyle,
    this.color,
    this.splashColor,
    this.icon,
    this.width,
    this.borderRadius,
    this.padding,
    this.elevation = 0.0,
    this.isLoading = false,
    this.loader,
    this.onPressed,
  })  : _type = _Type.filled,
        borderSide = null;

  const PeamanButton.bordered({
    super.key,
    this.value,
    this.valueStyle,
    this.borderSide,
    this.splashColor,
    this.icon,
    this.width,
    this.borderRadius,
    this.padding,
    this.elevation = 0.0,
    this.isLoading = false,
    this.loader,
    this.onPressed,
  })  : _type = _Type.bordered,
        color = null;

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case _Type.filled:
        return _filledBuilder(context);
      case _Type.bordered:
        return _borderedBuilder(context);
      default:
    }

    return Container();
  }

  Widget _filledBuilder(final BuildContext context) {
    final elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: borderRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!.r),
            ),
      elevation: elevation,
      padding: padding,
    );

    return SizedBox(
      width: width?.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: elevatedButtonStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon ?? Container(),
            if (icon != null && value != null)
              const SizedBox(
                width: 10.0,
              ),
            if (value != null)
              Text(
                '$value',
                style: valueStyle,
              ),
            if (isLoading && value != null)
              const SizedBox(
                width: 20.0,
              ),
            if (isLoading)
              loader ??
                  PeamanSpinner(
                    size: 15.h,
                    color: PeamanColors.white,
                  )
          ],
        ),
      ),
    );
  }

  Widget _borderedBuilder(final BuildContext context) {
    final outlinedButtonStyle = OutlinedButton.styleFrom(
      side: borderSide,
      shape: borderRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!.r),
            ),
      elevation: elevation,
      padding: padding,
    );

    return SizedBox(
      width: width?.w,
      child: OutlinedButton(
        onPressed: onPressed,
        style: outlinedButtonStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon ?? Container(),
            if (icon != null && value != null)
              const SizedBox(
                width: 10.0,
              ),
            if (value != null)
              Text(
                '$value',
                style: valueStyle,
              ),
            if (isLoading && value != null)
              const SizedBox(
                width: 20.0,
              ),
            if (isLoading)
              loader ??
                  PeamanSpinner(
                    size: 15.h,
                    color: outlinedButtonStyle.side?.resolve(
                      const <MaterialState>{
                        MaterialState.pressed,
                        MaterialState.hovered,
                        MaterialState.focused,
                      },
                    )?.color,
                  ),
          ],
        ),
      ),
    );
  }
}
