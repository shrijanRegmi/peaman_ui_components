import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final Function(Function())? onPressedLeading;

  const PeamanAppbar({
    super.key,
    required this.title,
    this.height = kToolbarHeight - 10,
    this.onPressedLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: PeamanText.subtitle2(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        iconSize: 20.0,
        onPressed: () => onPressedLeading == null
            ? context.pop()
            : onPressedLeading?.call(() => context.pop()),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
