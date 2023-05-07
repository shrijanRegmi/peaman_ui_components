import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileAboutItem extends ConsumerStatefulWidget {
  const PeamanProfileAboutItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onPressed,
    super.key,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Function()? onPressed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileAboutItemState();
}

class _PeamanProfileAboutItemState
    extends ConsumerState<PeamanProfileAboutItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.icon,
      minLeadingWidth: 10.w,
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PeamanText.body2(
                  widget.title,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: PeamanColors.greyDark,
                  ),
                ),
                PeamanText.body1(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          widget.trailing ?? const SizedBox(),
        ],
      ),
      onTap: widget.onPressed,
    ).pY(3);
  }
}
