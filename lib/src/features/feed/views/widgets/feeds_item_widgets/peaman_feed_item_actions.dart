import 'package:flutter/material.dart';
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
    Function(),
  )? commentBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    Function(),
  )? reactBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    Function(),
  )? saveBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    Function(),
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
    return widget.commentBuilder?.call(
          context,
          ref,
          widget.feed,
          _onPressedComment,
        ) ??
        _actionButtonBuilder(
          svgPath: 'assets/svgs/outlined_comment.svg',
          count: widget.feed.commentsCount,
          onPressed: () {
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
          },
        );
  }

  Widget _reactBuilder() {
    return widget.reactBuilder?.call(
          context,
          ref,
          widget.feed,
          _onPressedReact,
        ) ??
        _actionButtonBuilder(
          svgPath: 'assets/svgs/outlined_love.svg',
          activeColor: PeamanColors.red80,
          count: widget.feed.reactionsCount,
          isActive: widget.feed.isReacted,
          onPressed: () {
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
          },
        );
  }

  Widget _saveBuilder() {
    return widget.saveBuilder?.call(
          context,
          ref,
          widget.feed,
          _onPressedSave,
        ) ??
        _actionButtonBuilder(
          svgPath: 'assets/svgs/outlined_bookmark.svg',
          count: widget.feed.savesCount,
          activeColor: PeamanColors.secondary,
          isActive: widget.feed.isSaved,
          size: 18,
          onPressed: () {
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
          },
        );
  }

  Widget _shareBuilder() {
    return widget.shareBuilder?.call(
          context,
          ref,
          widget.feed,
          _onPressedShare,
        ) ??
        _actionButtonBuilder(
          svgPath: 'assets/svgs/outlined_send_message.svg',
          count: widget.feed.sharesCount,
          size: 15,
          onPressed: () {
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
          },
        );
  }

  void _onPressedComment() {}

  void _onPressedReact() {
    if (widget.feed.isReacted) {
      ref.read(providerOfPeamanFeed.notifier).deleteFeedReaction(
            feedId: widget.feed.id!,
            feedOwnerId: widget.feed.ownerId!,
          );
    } else {
      ref.read(providerOfPeamanFeed.notifier).createFeedReaction(
            feedId: widget.feed.id!,
            feedOwnerId: widget.feed.ownerId!,
          );
    }
  }

  void _onPressedSave() {
    if (widget.feed.isSaved) {
      ref.read(providerOfPeamanFeed.notifier).unsaveFeed(
            feedId: widget.feed.id!,
          );
    } else {
      ref.read(providerOfPeamanFeed.notifier).saveFeed(
            feedId: widget.feed.id!,
          );
    }
  }

  void _onPressedShare() {
    showPeamanNormalBottomsheet(
      context: context,
      widget: PeamanFeedSharePopup(
        feed: widget.feed,
      ),
    );
  }
}
