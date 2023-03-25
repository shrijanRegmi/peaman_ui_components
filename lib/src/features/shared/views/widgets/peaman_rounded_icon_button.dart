import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanRoundIconButton extends StatelessWidget {
  final Widget icon;
  final Widget? overlayWidget;
  final EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final BoxShadow? shadow;
  final Function()? onPressed;

  const PeamanRoundIconButton({
    Key? key,
    required this.icon,
    this.overlayWidget,
    this.bgColor,
    this.padding,
    this.shadow,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor ?? context.theme.colorScheme.background,
              boxShadow: [
                shadow ??
                    const BoxShadow(
                      color: Colors.transparent,
                    )
              ],
            ),
            padding: padding ?? const EdgeInsets.all(12.0),
            child: icon,
          ),
          Positioned(
            right: -2.0,
            top: -9.0,
            child: overlayWidget ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
