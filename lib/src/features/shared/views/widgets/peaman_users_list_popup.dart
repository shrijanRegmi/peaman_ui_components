import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  expandedByUids,
  expandedByUsers,
}

class PeamanUsersListPopup extends ConsumerStatefulWidget {
  const PeamanUsersListPopup.expandedByUids({
    super.key,
    required this.userIds,
    this.title,
    this.initialItemPadding,
    this.itemPadding,
    this.searchType = PeamanSearchType.none,
    this.physics = const BouncingScrollPhysics(),
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.onPressedUser,
  })  : type = _Type.expandedByUids,
        users = const [],
        onPressedSearch = null,
        scrollDirection = Axis.vertical,
        height = 0.0;

  const PeamanUsersListPopup.expandedByUsers({
    super.key,
    required this.users,
    this.title,
    this.initialItemPadding,
    this.itemPadding,
    this.physics = const BouncingScrollPhysics(),
    this.searchType = PeamanSearchType.none,
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.onPressedUser,
  })  : type = _Type.expandedByUsers,
        userIds = const [],
        onPressedSearch = null,
        scrollDirection = Axis.vertical,
        height = 0.0;

  final _Type type;

  final String? title;
  final List<String> userIds;
  final List<PeamanUser> users;
  final PeamanSearchType searchType;
  final Axis scrollDirection;
  final ScrollPhysics physics;
  final EdgeInsets? initialItemPadding;
  final EdgeInsets? itemPadding;
  final double height;
  final Widget Function(PeamanUser)? avatarBuilder;
  final Widget Function(PeamanUser)? nameBuilder;
  final Widget Function(PeamanUser)? captionBuilder;
  final List<Widget> Function(PeamanUser)? actionWidgetsBuilder;
  final Function(PeamanUser)? onPressedUser;
  final Function()? onPressedSearch;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanUsersListBottomsheetState();
}

class _PeamanUsersListBottomsheetState
    extends ConsumerState<PeamanUsersListPopup> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, visible) {
        return SizedBox(
          height: visible
              ? ScreenUtil().screenHeight - ScreenUtil().statusBarHeight
              : 500.0,
          child: SafeArea(
            child: Column(
              children: [
                _headerBuilder().pX(20).pT(20).pB(15),
                if (widget.searchType != PeamanSearchType.none)
                  _searchBuilder().pB(10),
                Expanded(
                  child: _listBuilder(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _headerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PeamanText.heading6(
          widget.title,
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        PeamanRoundIconButton(
          icon: Icon(
            Icons.close_rounded,
            size: 16.w,
          ),
          padding: EdgeInsets.all(9.w),
          onPressed: () => context.pop(),
        )
      ],
    );
  }

  Widget _searchBuilder() {
    return const PeamanInput(
      hintText: 'Search...',
      height: 40.0,
    );
  }

  Widget _listBuilder() {
    switch (widget.type) {
      case _Type.expandedByUids:
        return PeamanUsersList.expandedByUids(
          userIds: widget.userIds,
          initialItemPadding: widget.initialItemPadding,
          itemPadding: widget.itemPadding ??
              EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 6.h,
              ),
          physics: widget.physics,
          avatarBuilder: widget.avatarBuilder ??
              (user) => PeamanAvatarBuilder.network(
                    user.photo,
                    size: 45,
                  ),
          nameBuilder: widget.nameBuilder ??
              (user) => PeamanText.subtitle2(
                    user.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          captionBuilder:
              widget.captionBuilder ?? (user) => PeamanText.caption(user.bio),
          actionWidgetsBuilder: widget.actionWidgetsBuilder,
          onPressedUser: widget.onPressedUser,
        );
      case _Type.expandedByUsers:
        return PeamanUsersList.expandedByUsers(
          users: widget.users,
          initialItemPadding: widget.initialItemPadding,
          itemPadding: widget.itemPadding ??
              EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 6.h,
              ),
          physics: widget.physics,
          avatarBuilder: widget.avatarBuilder ??
              (user) => PeamanAvatarBuilder.network(
                    user.photo,
                    size: 45,
                  ),
          nameBuilder: widget.nameBuilder ??
              (user) => PeamanText.subtitle2(
                    user.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          captionBuilder:
              widget.captionBuilder ?? (user) => PeamanText.caption(user.bio),
          actionWidgetsBuilder: widget.actionWidgetsBuilder,
          onPressedUser: widget.onPressedUser,
        );
      default:
    }

    return const SizedBox();
  }
}
