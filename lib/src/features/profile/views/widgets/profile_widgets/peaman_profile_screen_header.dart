import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileScreenHeader extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const PeamanProfileScreenHeader({
    super.key,
    required this.user,
    this.titleText,
    this.title,
    this.backgroundColor,
    this.leading,
    this.leadingWidth,
    this.centerTitle = true,
    this.elevation = 4.0,
    this.height = kToolbarHeight - 10,
    this.onPressedTitle,
    this.onPressedLeading,
    this.actions = const [],
  });

  final PeamanUser user;
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
    extends ConsumerState<PeamanProfileScreenHeader> {
  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(
      providerOfLoggedInUser.select((value) => value.uid!),
    );

    ref.listen(providerOfPeamanAuth, (previous, next) {
      if (previous?.signOutState != next.signOutState) {
        next.signOutState.maybeWhen(
          success: (_) => context.pushNamedAndRemoveUntil(
            PeamanWrapper.route,
          ),
          orElse: () {},
        );
      }
    });

    return PeamanAppbar(
      titleText: widget.titleText,
      title: widget.title ??
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PeamanText.subtitle2(
                '@${widget.user.userName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.user.isVerified) const PeamanVerifiedBadge().pL(4.0),
            ],
          ),
      backgroundColor:
          widget.backgroundColor ?? context.theme.scaffoldBackgroundColor,
      onPressedTitle: widget.onPressedTitle,
      onPressedLeading: widget.onPressedLeading,
      elevation: 0,
      leadingWidth: widget.leadingWidth,
      leading: widget.leading,
      centerTitle: widget.centerTitle,
      actions: widget.actions.isNotEmpty
          ? widget.actions
          : [
              Opacity(
                opacity: widget.user.uid == uid ? 1.0 : 0.0,
                child: Center(
                  child: PeamanRoundIconButton(
                    padding: EdgeInsets.all(7.w),
                    onPressed: () {
                      if (widget.user.uid == uid) {
                        ref.watch(providerOfPeamanAuth.notifier).signOut();
                      }
                    },
                    icon: Icon(
                      Icons.logout_rounded,
                      size: 16.w,
                    ),
                  ).pR(10.0),
                ),
              ),
            ],
    );
  }
}
