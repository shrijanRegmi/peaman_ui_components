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
    this.expandOnKeyboard = true,
    this.filterBuilder,
    this.searchFilterBuilder,
    this.itemBuilder,
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
    this.expandOnKeyboard = true,
    this.filterBuilder,
    this.searchFilterBuilder,
    this.itemBuilder,
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
  final bool expandOnKeyboard;
  final Axis scrollDirection;
  final ScrollPhysics physics;
  final EdgeInsets? initialItemPadding;
  final EdgeInsets? itemPadding;
  final double height;
  final List<PeamanUser> Function(BuildContext, WidgetRef, List<PeamanUser>)?
      filterBuilder;
  final List<PeamanUser> Function(BuildContext, WidgetRef, List<PeamanUser>)?
      searchFilterBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? itemBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? avatarBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? nameBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? captionBuilder;
  final List<Widget> Function(BuildContext, WidgetRef, PeamanUser)?
      actionWidgetsBuilder;
  final Function(BuildContext, WidgetRef, PeamanUser)? onPressedUser;
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
          height: visible && widget.expandOnKeyboard
              ? ScreenUtil().screenHeight
              : 450.h,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: visible && widget.expandOnKeyboard
                      ? ScreenUtil().statusBarHeight
                      : 0.0,
                ),
                _headerBuilder().pX(20).pT(20).pB(15),
                Expanded(
                  child: widget.searchType == PeamanSearchType.none
                      ? _listBuilder()
                      : PeamanSearchBuilder<List<PeamanUser>>.users(
                          searchType: widget.searchType,
                          filterBuilder: widget.searchFilterBuilder,
                          initialBuilder: (context, ref) => _listBuilder(),
                          emptyBuilder: (context, ref) =>
                              const PeamanEmptyBuilder(
                            subTitle: 'No results found!',
                          ),
                          builder: (context, ref, users) {
                            return _expandedByUsersListBuilder(users: users);
                          },
                        ),
                ),
                SizedBox(
                  height: 20.h,
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

  Widget _listBuilder() {
    switch (widget.type) {
      case _Type.expandedByUids:
        return _expandedByUserIdsListBuilder();
      case _Type.expandedByUsers:
        return _expandedByUsersListBuilder(
          users: widget.filterBuilder?.call(
                context,
                ref,
                widget.users,
              ) ??
              widget.users,
        );
      default:
    }

    return const SizedBox();
  }

  Widget _expandedByUserIdsListBuilder() {
    return PeamanUsersList.expandedByUids(
      userIds: widget.userIds,
      physics: widget.physics,
      initialItemPadding: widget.initialItemPadding,
      itemPadding: widget.itemPadding ??
          EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 6.h,
          ),
      avatarBuilder: widget.avatarBuilder ??
          (context, ref, user) => PeamanAvatarBuilder.network(
                user.photo,
                size: 45,
              ),
      nameBuilder: widget.nameBuilder ??
          (context, ref, user) => PeamanText.subtitle2(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
      captionBuilder: widget.captionBuilder ??
          (context, ref, user) => PeamanText.caption(user.bio),
      actionWidgetsBuilder: widget.actionWidgetsBuilder,
      onPressedUser: widget.onPressedUser,
    );
  }

  Widget _expandedByUsersListBuilder({
    required final List<PeamanUser> users,
  }) {
    return PeamanUsersList.expandedByUsers(
      users: users,
      initialItemPadding: widget.initialItemPadding,
      itemPadding: widget.itemPadding ??
          EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 6.h,
          ),
      physics: widget.physics,
      avatarBuilder: widget.avatarBuilder ??
          (context, ref, user) => PeamanAvatarBuilder.network(
                user.photo,
                size: 45,
              ),
      nameBuilder: widget.nameBuilder ??
          (context, ref, user) => PeamanText.subtitle2(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
      captionBuilder: (context, ref, user) =>
          widget.captionBuilder?.call(context, ref, user) ??
          PeamanText.caption(user.bio),
      actionWidgetsBuilder: widget.actionWidgetsBuilder,
      onPressedUser: widget.onPressedUser,
    );
  }
}
