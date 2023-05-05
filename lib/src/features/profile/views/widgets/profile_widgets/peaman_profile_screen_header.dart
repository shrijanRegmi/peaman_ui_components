import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileScreenHeader extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const PeamanProfileScreenHeader({
    super.key,
    required this.userId,
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

  final String userId;
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
    final userFuture = ref.watch(
      providerOfSingleUserByIdFuture(widget.userId),
    );
    final userName = userFuture.maybeWhen(
      data: (data) => data.when(
        (success) => '@${success.userName}',
        (failure) => '',
      ),
      orElse: () => '',
    );
    final isVerified = userFuture.maybeWhen(
      data: (data) => data.when(
        (success) => success.isVerified,
        (failure) => false,
      ),
      orElse: () => false,
    );

    return PeamanAppbar(
      titleText: widget.titleText,
      title: widget.title ??
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!userFuture.isLoading)
                PeamanText.subtitle2(
                  userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (!userFuture.isLoading && isVerified)
                const PeamanVerifiedBadge().pL(4.0),
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
                opacity: widget.userId == uid ? 1.0 : 0.0,
                child: Center(
                  child: PeamanRoundIconButton(
                    padding: EdgeInsets.all(7.w),
                    onPressed: () {
                      if (widget.userId == uid) {
                        showPeamanProfileMenuBottomsheet(
                          context: context,
                          userId: widget.userId,
                        );
                      }
                    },
                    icon: Icon(
                      Icons.more_horiz_rounded,
                      size: 16.w,
                    ),
                  ).pR(10.0),
                ),
              ),
            ],
    );
  }
}
