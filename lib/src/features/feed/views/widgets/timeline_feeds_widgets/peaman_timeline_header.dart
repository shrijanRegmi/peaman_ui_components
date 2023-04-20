import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanTimelineHeader extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const PeamanTimelineHeader({
    super.key,
    this.titleText,
    this.title,
    this.leading,
    this.leadingWidth,
    this.centerTitle = true,
    this.elevation = 4.0,
    this.height = kToolbarHeight - 10,
    this.onPressedTitle,
    this.onPressedLeading,
    this.actions = const [],
  });

  final String? titleText;
  final Widget? title;
  final double elevation;
  final double height;
  final double? leadingWidth;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget> actions;
  final Function(Function())? onPressedTitle;
  final Function(Function())? onPressedLeading;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanTimelineHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}

class _PeamanTimelineHeaderState extends ConsumerState<PeamanTimelineHeader> {
  @override
  Widget build(BuildContext context) {
    final appUserPhoto = ref.watch(
      providerOfLoggedInUser.select((value) => value.photo),
    );
    return PeamanAppbar(
      titleText: widget.titleText,
      title: widget.title ??
          PeamanText.heading4(
            'Peaman',
            style: GoogleFonts.caveat(),
          ),
      onPressedTitle: widget.onPressedTitle,
      onPressedLeading: widget.onPressedLeading,
      elevation: 0.5,
      leadingWidth: widget.leadingWidth,
      leading: widget.leading ??
          Center(
            child: PeamanAvatarBuilder.network(
              appUserPhoto,
              size: 33.0,
            ),
          ),
      centerTitle: widget.centerTitle,
      actions: widget.actions.isNotEmpty
          ? widget.actions
          : [
              Center(
                child: PeamanRoundIconButton(
                  padding: EdgeInsets.all(7.w),
                  onPressed: () => context.pushNamed(
                    PeamanChatsListScreen.route,
                  ),
                  icon: SvgPicture.asset(
                    'assets/svgs/outlined_send_message.svg',
                    package: 'peaman_ui_components',
                    color: context.isDarkMode
                        ? PeamanColors.white70
                        : PeamanColors.black,
                    width: 16.w,
                  ),
                ).pR(10.0),
              ),
            ],
    );
  }
}
