import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanTimelineFeedsScreenHeader extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const PeamanTimelineFeedsScreenHeader({
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
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanTimelineHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}

class _PeamanTimelineHeaderState
    extends ConsumerState<PeamanTimelineFeedsScreenHeader> {
  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(
      providerOfLoggedInUser.select((value) => value.uid),
    );
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
      backgroundColor: widget.backgroundColor,
      onPressedTitle: widget.onPressedTitle,
      onPressedLeading: widget.onPressedLeading,
      elevation: widget.elevation,
      leadingWidth: widget.leadingWidth,
      leading: widget.leading ??
          Center(
            child: PeamanAvatarBuilder.network(
              appUserPhoto,
              size: 33.0,
              onPressed: () => context.pushNamed(
                PeamanProfileScreen.route,
                arguments: PeamanProfileScreenArgs(
                  userId: uid!,
                ),
              ),
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
