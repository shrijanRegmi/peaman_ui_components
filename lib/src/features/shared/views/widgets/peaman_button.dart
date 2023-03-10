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
  final BorderSide? borderSide;

  final Widget? icon;
  final double? minWidth;
  final double borderRadius;
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
    this.icon,
    this.minWidth,
    this.borderRadius = 5.0,
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
    this.icon,
    this.minWidth,
    this.borderRadius = 5.0,
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
    final theme = context.theme;
    final thisColor = color ?? theme.colorScheme.primary;

    return MaterialButton(
      onPressed: onPressed,
      color: thisColor,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: elevation,
      padding: padding,
      disabledColor: theme.disabledColor,
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
              style: valueStyle ??
                  const TextStyle(
                    color: Colors.white,
                  ),
            ),
          if (isLoading && value != null)
            const SizedBox(
              width: 20.0,
            ),
          if (isLoading)
            const PeamanSpinner(
              size: 20.0,
              color: PeamanColors.white,
            )
        ],
      ),
    );
  }

  Widget _borderedBuilder(final BuildContext context) {
    final theme = context.theme;
    final thisBorderSide = borderSide ??
        BorderSide(
          color: theme.colorScheme.primary,
        );

    return MaterialButton(
      onPressed: onPressed,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: thisBorderSide,
      ),
      elevation: elevation,
      padding: padding,
      highlightColor: Colors.transparent,
      focusColor: thisBorderSide.color.withOpacity(0.2),
      hoverColor: thisBorderSide.color.withOpacity(0.2),
      splashColor: thisBorderSide.color.withOpacity(0.2),
      disabledColor: theme.disabledColor,
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
              style: valueStyle ??
                  TextStyle(
                    color: thisBorderSide.color,
                  ),
            ),
          if (isLoading && value != null)
            const SizedBox(
              width: 20.0,
            ),
          if (isLoading)
            PeamanSpinner(
              color: thisBorderSide.color,
            ),
        ],
      ),
    );
  }
}
