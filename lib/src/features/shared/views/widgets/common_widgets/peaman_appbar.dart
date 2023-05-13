import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? title;
  final double elevation;
  final double height;
  final double? leadingWidth;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget> actions;
  final Color? backgroundColor;
  final Function(Function())? onPressedTitle;
  final Function(Function())? onPressedLeading;

  const PeamanAppbar({
    super.key,
    this.titleText,
    this.title,
    this.leading,
    this.leadingWidth,
    this.centerTitle = true,
    this.elevation = 4.0,
    this.height = kToolbarHeight - 10,
    this.actions = const [],
    this.backgroundColor,
    this.onPressedTitle,
    this.onPressedLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ??
          (titleText.isNull
              ? null
              : PeamanText.subtitle2(
                  titleText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () => onPressedTitle?.call(() {}),
                )),
      backgroundColor: backgroundColor,
      elevation: elevation,
      leadingWidth: leadingWidth,
      leading: leading != null
          ? leading!.onPressed(
              () => onPressedLeading?.call(() {}),
            )
          : Center(
              child: PeamanRoundIconButton(
                padding: EdgeInsets.all(7.w),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 16.w,
                ),
                onPressed: () => onPressedLeading.isNull
                    ? context.pop()
                    : onPressedLeading?.call(() => context.pop()),
              ),
            ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
