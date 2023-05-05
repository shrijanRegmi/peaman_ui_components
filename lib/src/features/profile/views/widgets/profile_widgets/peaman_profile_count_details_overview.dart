import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCountDetailsOverview extends ConsumerStatefulWidget {
  const PeamanProfileCountDetailsOverview({
    super.key,
    required this.user,
    this.postsCountBuilder,
    this.followersCountBuilder,
    this.followingsCountBuilder,
    this.reactionsCountBuilder,
    this.onPressedPostsCount,
    this.onPressedFollowersCount,
    this.onPressedFollowingsCount,
    this.onPressedReactionsCount,
    this.dividerBuilder,
  });

  final PeamanUser user;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? postsCountBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? followersCountBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? followingsCountBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? reactionsCountBuilder;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? dividerBuilder;

  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? onPressedPostsCount;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? onPressedFollowersCount;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? onPressedFollowingsCount;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? onPressedReactionsCount;

  @override
  ConsumerState<PeamanProfileCountDetailsOverview> createState() =>
      _PeamanProfileCountDetailsOverviewState();
}

class _PeamanProfileCountDetailsOverviewState
    extends ConsumerState<PeamanProfileCountDetailsOverview> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        widget.postsCountBuilder?.call(context, ref, widget.user) ??
            _itemBuilder(
              title: 'Posts',
              count: widget.user.feedsCount,
              onPressed: () => widget.onPressedPostsCount == null
                  ? _onPressedPostsCount()
                  : widget.onPressedPostsCount?.call(
                      context,
                      ref,
                      widget.user,
                      _onPressedPostsCount,
                    ),
            ),
        _dividerBuilder(),
        widget.postsCountBuilder?.call(context, ref, widget.user) ??
            _itemBuilder(
              title: 'Followers',
              count: widget.user.followersCount,
              onPressed: () => widget.onPressedFollowersCount == null
                  ? _onPressedFollowersCount()
                  : widget.onPressedFollowersCount?.call(
                      context,
                      ref,
                      widget.user,
                      _onPressedFollowersCount,
                    ),
            ),
        _dividerBuilder(),
        widget.postsCountBuilder?.call(context, ref, widget.user) ??
            _itemBuilder(
              title: 'Followings',
              count: widget.user.followingCount,
              onPressed: () => widget.onPressedFollowingsCount == null
                  ? _onPressedFollowingsCount()
                  : widget.onPressedFollowingsCount?.call(
                      context,
                      ref,
                      widget.user,
                      _onPressedFollowingsCount,
                    ),
            ),
        _dividerBuilder(),
        widget.postsCountBuilder?.call(context, ref, widget.user) ??
            _itemBuilder(
              title: 'Reactions',
              count: widget.user.reactionsReceivedFromFeedsCount,
              onPressed: () => widget.onPressedReactionsCount == null
                  ? _onPressedReactionsCount()
                  : widget.onPressedReactionsCount?.call(
                      context,
                      ref,
                      widget.user,
                      _onPressedReactionsCount,
                    ),
            ),
      ],
    );
  }

  Widget _itemBuilder({
    required final String title,
    required final int count,
    final Function()? onPressed,
  }) {
    return Column(
      children: [
        PeamanText.subtitle1(
          count.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        PeamanText.body1(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            color: PeamanColors.grey,
          ),
        ),
      ],
    ).onPressed(onPressed);
  }

  Widget _dividerBuilder() {
    return widget.dividerBuilder?.call(context, ref, widget.user) ??
        Container(
          width: 1.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: PeamanColors.extraLightGrey.withOpacity(0.2),
          ),
        );
  }

  void _onPressedPostsCount() {}
  void _onPressedFollowersCount() {}
  void _onPressedFollowingsCount() {}
  void _onPressedReactionsCount() {}
}
