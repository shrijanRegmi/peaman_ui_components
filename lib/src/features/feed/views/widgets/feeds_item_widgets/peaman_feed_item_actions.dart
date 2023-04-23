import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedItemActions extends ConsumerStatefulWidget {
  const PeamanFeedItemActions({
    super.key,
    required this.feed,
    this.commentBuilder,
    this.reactBuilder,
    this.saveBuilder,
    this.shareBuilder,
    this.actionWidgetsBuilder,
    this.onPressedComment,
    this.onPressedReact,
    this.onPressedSave,
    this.onPressedShare,
  });

  final PeamanFeed feed;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? commentBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? reactBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? saveBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? shareBuilder;

  final List<Widget> Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    Widget commentBuilder,
    Widget reactBuilder,
    Widget saveBuilder,
    Widget shareBuilder,
  )? actionWidgetsBuilder;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    Function(),
  )? onPressedComment;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    Function(),
  )? onPressedReact;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    Function(),
  )? onPressedSave;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    Function(),
  )? onPressedShare;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedItemActionsState();
}

class _PeamanFeedItemActionsState extends ConsumerState<PeamanFeedItemActions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.actionWidgetsBuilder?.call(
            context,
            ref,
            widget.feed,
            _commentBuilder(),
            _reactBuilder(),
            _saveBuilder(),
            _shareBuilder(),
          ) ??
          [
            _commentBuilder(),
            _reactBuilder(),
            _saveBuilder(),
            _shareBuilder(),
          ],
    );
  }

  Widget _actionButtonBuilder({
    required final String svgPath,
    required final int count,
    final double size = 16,
    final bool isActive = false,
    final Color? activeColor,
    final Function()? onPressed,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          isActive ? svgPath.replaceAll('outlined', 'filled') : svgPath,
          package: 'peaman_ui_components',
          width: size.w,
          color: isActive
              ? activeColor ?? PeamanColors.midLightGrey
              : PeamanColors.midLightGrey,
        ),
        SizedBox(
          width: 8.w,
        ),
        PeamanText.body2(
          count.toString(),
          style: TextStyle(
            fontSize: 11.sp,
          ),
        )
      ],
    ).onPressed(onPressed);
  }

  Widget _commentBuilder() {
    return (widget.commentBuilder?.call(context, ref, widget.feed) ??
            _actionButtonBuilder(
              svgPath: 'assets/svgs/outlined_comment.svg',
              count: 21,
            ))
        .onPressed(() {
      if (widget.onPressedComment != null) {
        widget.onPressedComment?.call(
          context,
          ref,
          widget.feed,
          _onPressedComment,
        );
      } else {
        _onPressedComment();
      }
    });
  }

  Widget _reactBuilder() {
    return (widget.reactBuilder?.call(context, ref, widget.feed) ??
            _actionButtonBuilder(
              svgPath: 'assets/svgs/outlined_love.svg',
              activeColor: PeamanColors.red80,
              count: 99,
            ))
        .onPressed(() {
      if (widget.onPressedReact != null) {
        widget.onPressedReact?.call(
          context,
          ref,
          widget.feed,
          _onPressedReact,
        );
      } else {
        _onPressedReact();
      }
    });
  }

  Widget _saveBuilder() {
    return (widget.saveBuilder?.call(context, ref, widget.feed) ??
            _actionButtonBuilder(
              svgPath: 'assets/svgs/outlined_bookmark.svg',
              count: 12,
              activeColor: PeamanColors.secondary,
              size: 18,
            ))
        .onPressed(() {
      if (widget.onPressedSave != null) {
        widget.onPressedSave?.call(
          context,
          ref,
          widget.feed,
          _onPressedSave,
        );
      } else {
        _onPressedSave();
      }
    });
  }

  Widget _shareBuilder() {
    return (widget.shareBuilder?.call(context, ref, widget.feed) ??
            _actionButtonBuilder(
              svgPath: 'assets/svgs/outlined_send_message.svg',
              count: 88,
              size: 15,
            ))
        .onPressed(() {
      if (widget.onPressedShare != null) {
        widget.onPressedShare?.call(
          context,
          ref,
          widget.feed,
          _onPressedShare,
        );
      } else {
        _onPressedShare();
      }
    });
  }

  void _onPressedComment() {}

  void _onPressedReact() {
    ref.read(providerOfPeamanLocalNotification.notifier).showAlertNotification(
          title: 'Reaction',
          body: 'Shrijan Regmi reacted to your post!',
        );
  }

  void _onPressedSave() {}

  void _onPressedShare() {}
}
