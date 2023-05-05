import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCategoryHeader extends ConsumerStatefulWidget {
  const PeamanProfileCategoryHeader({
    super.key,
    required this.user,
    this.allFeedsTabBuilder,
    this.imageFeedsTabBuilder,
    this.videoFeedsTabBuilder,
    this.youtubeFeedsTabBuilder,
    this.pollFeedsTabBuilder,
    this.aboutTabBuilder,
    this.tabsBuilder,
    this.onPressedTab,
    this.labelColor,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.indicatorWidth = 1.2,
  });

  final PeamanUser user;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? allFeedsTabBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? imageFeedsTabBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? videoFeedsTabBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? youtubeFeedsTabBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? pollFeedsTabBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? aboutTabBuilder;

  final List<Widget> Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? tabsBuilder;

  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    int,
    Function(),
  )? onPressedTab;

  final Color? labelColor;
  final Color? unselectedLabelColor;
  final Color? indicatorColor;
  final double indicatorWidth;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileCategoryHeaderState();
}

class _PeamanProfileCategoryHeaderState
    extends ConsumerState<PeamanProfileCategoryHeader> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: widget.indicatorColor ??
          (context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary),
      labelColor: widget.labelColor ??
          (context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary),
      unselectedLabelColor:
          widget.unselectedLabelColor ?? PeamanColors.extraLightGrey,
      indicatorWeight: widget.indicatorWidth,
      tabs: widget.tabsBuilder?.call(context, ref, widget.user) ??
          [
            widget.allFeedsTabBuilder?.call(context, ref, widget.user) ??
                Tab(
                  icon: Icon(
                    Icons.category_rounded,
                    size: 20.w,
                  ),
                ),
            widget.imageFeedsTabBuilder?.call(context, ref, widget.user) ??
                Tab(
                  icon: Icon(
                    Icons.image_rounded,
                    size: 19.w,
                  ),
                ),
            widget.videoFeedsTabBuilder?.call(context, ref, widget.user) ??
                Tab(
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    size: 26.w,
                  ),
                ),
            widget.youtubeFeedsTabBuilder?.call(context, ref, widget.user) ??
                Tab(
                  icon: SvgPicture.asset(
                    'assets/svgs/filled_youtube.svg',
                    width: 20.w,
                    color: _selectedIndex == 3
                        ? context.isDarkMode
                            ? PeamanColors.white70
                            : context.theme.colorScheme.primary
                        : PeamanColors.extraLightGrey,
                    package: 'peaman_ui_components',
                  ),
                ),
            widget.pollFeedsTabBuilder?.call(context, ref, widget.user) ??
                Tab(
                  icon: Icon(
                    Icons.poll_rounded,
                    size: 20.w,
                  ),
                ),
            widget.aboutTabBuilder?.call(context, ref, widget.user) ??
                Tab(
                  icon: Icon(
                    Icons.person_pin_rounded,
                    size: 20.w,
                  ),
                ),
          ],
      onTap: (index) => widget.onPressedTab == null
          ? _onPressedTab(index)
          : widget.onPressedTab?.call(
              context,
              ref,
              widget.user,
              index,
              () => _onPressedTab(index),
            ),
    );
  }

  void _onPressedTab(final int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
