import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double height;
  final List<Widget> actions;
  final Function(Function())? onPressedTitle;
  final Function(Function())? onPressedLeading;

  const PeamanAppbar({
    super.key,
    this.title,
    this.height = kToolbarHeight - 10,
    this.onPressedTitle,
    this.onPressedLeading,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title.isNull
          ? null
          : PeamanText.subtitle2(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              onPressed: () => onPressedTitle?.call(() {}),
            ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        iconSize: 20.0,
        onPressed: () => onPressedLeading.isNull
            ? context.pop()
            : onPressedLeading?.call(() => context.pop()),
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
