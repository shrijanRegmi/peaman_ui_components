import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCreateFeedScreenHeader extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const PeamanCreateFeedScreenHeader({
    super.key,
    this.titleText,
    this.title,
    this.backgroundColor,
    this.leading,
    this.leadingWidth,
    this.centerTitle = true,
    this.elevation = 0.5,
    this.height = kToolbarHeight - 10,
    this.onPressedTitle,
    this.onPressedLeading,
    this.actions = const [],
  });

  final String? titleText;
  final Widget? title;
  final Color? backgroundColor;
  final double elevation;
  final double height;
  final double? leadingWidth;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget> actions;
  final Function(Function())? onPressedTitle;
  final Function(Function())? onPressedLeading;

  @override
  Size get preferredSize => Size.fromHeight(height.h);

  @override
  ConsumerState<PeamanCreateFeedScreenHeader> createState() =>
      _PeamanCreateFeedScreenHeaderState();
}

class _PeamanCreateFeedScreenHeaderState
    extends ConsumerState<PeamanCreateFeedScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return PeamanAppbar(
      titleText: widget.titleText,
      title: widget.title ??
          PeamanText.heading4(
            'Create Post',
            style: GoogleFonts.caveat(),
          ),
      backgroundColor: widget.backgroundColor,
      onPressedTitle: widget.onPressedTitle,
      onPressedLeading: widget.onPressedLeading,
      elevation: widget.elevation,
      leadingWidth: widget.leadingWidth,
      leading: widget.leading ??
          Center(
            child: PeamanRoundIconButton(
              padding: EdgeInsets.all(7.w),
              onPressed: context.pop,
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 16.w,
              ),
            ),
          ),
      centerTitle: widget.centerTitle,
      actions: widget.actions.isNotEmpty
          ? widget.actions
          : [
              Center(
                child: Opacity(
                  opacity: 0.0,
                  child: PeamanRoundIconButton(
                    padding: EdgeInsets.all(7.w),
                    onPressed: () {},
                    icon: Icon(
                      Icons.ac_unit_rounded,
                      size: 16.w,
                    ),
                  ).pR(10.0),
                ),
              ),
            ],
    );
  }
}
