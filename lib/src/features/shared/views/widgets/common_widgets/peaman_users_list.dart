import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  expandedByUids,
  expandedByUsers,
  roundedByUids,
  roundedByUsers,
}

class PeamanUsersList extends ConsumerStatefulWidget {
  const PeamanUsersList.expandedByUids({
    Key? key,
    required this.userIds,
    this.firstItemPadding,
    this.lastItemPadding,
    this.itemPadding,
    this.physics = const BouncingScrollPhysics(),
    this.filterBuilder,
    this.itemBuilder,
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.onPressedUser,
  })  : type = _Type.expandedByUids,
        users = const [],
        scrollDirection = Axis.vertical,
        height = 0.0,
        super(key: key);

  const PeamanUsersList.expandedByUsers({
    Key? key,
    required this.users,
    this.firstItemPadding,
    this.lastItemPadding,
    this.itemPadding,
    this.physics = const BouncingScrollPhysics(),
    this.filterBuilder,
    this.itemBuilder,
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.onPressedUser,
  })  : type = _Type.expandedByUsers,
        userIds = const [],
        scrollDirection = Axis.vertical,
        height = 0.0,
        super(key: key);

  const PeamanUsersList.roundedByUids({
    Key? key,
    required this.userIds,
    this.firstItemPadding,
    this.lastItemPadding,
    this.filterBuilder,
    this.itemPadding,
    this.physics = const BouncingScrollPhysics(),
    this.scrollDirection = Axis.vertical,
    this.itemBuilder,
    this.avatarBuilder,
    this.nameBuilder,
    this.onPressedUser,
    this.height = 90.0,
  })  : type = _Type.roundedByUids,
        users = const [],
        actionWidgetsBuilder = null,
        captionBuilder = null,
        super(key: key);

  const PeamanUsersList.roundedByUsers({
    Key? key,
    required this.users,
    this.firstItemPadding,
    this.lastItemPadding,
    this.filterBuilder,
    this.itemPadding,
    this.physics = const BouncingScrollPhysics(),
    this.scrollDirection = Axis.vertical,
    this.itemBuilder,
    this.avatarBuilder,
    this.nameBuilder,
    this.onPressedUser,
    this.height = 90.0,
  })  : type = _Type.roundedByUsers,
        userIds = const [],
        actionWidgetsBuilder = null,
        captionBuilder = null,
        super(key: key);

  final _Type type;

  final List<String> userIds;
  final List<PeamanUser> users;
  final Axis scrollDirection;
  final ScrollPhysics physics;
  final EdgeInsets? firstItemPadding;
  final EdgeInsets? lastItemPadding;
  final EdgeInsets? itemPadding;
  final double height;
  final List<PeamanUser> Function(
    BuildContext,
    WidgetRef,
    List<PeamanUser>,
  )? filterBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? itemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? avatarBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? nameBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? captionBuilder;
  final List<Widget> Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? actionWidgetsBuilder;
  final Function(BuildContext, WidgetRef, PeamanUser)? onPressedUser;

  @override
  ConsumerState<PeamanUsersList> createState() => _PeamanUsersListState();
}

class _PeamanUsersListState extends ConsumerState<PeamanUsersList> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case _Type.expandedByUids:
        return _byUidsBuilder();
      case _Type.expandedByUsers:
        return _byUsersBuilder();
      case _Type.roundedByUids:
        return _byUidsBuilder();
      case _Type.roundedByUsers:
        return _byUsersBuilder();
      default:
    }

    return Container();
  }

  Widget _byUidsBuilder() {
    return SizedBox(
      height: (widget.type == _Type.roundedByUids ||
                  widget.type == _Type.roundedByUsers) &&
              widget.scrollDirection == Axis.horizontal
          ? widget.height.h
          : null,
      child: ListView.builder(
        itemCount: widget.userIds.length,
        scrollDirection: widget.scrollDirection,
        physics: widget.physics,
        itemBuilder: (context, index) {
          final userId = widget.userIds[index];

          return widget.type == _Type.expandedByUids
              ? PeamanUsersListItem.expandedByUid(
                  userId: userId,
                  padding: index == 0
                      ? widget.firstItemPadding ?? widget.itemPadding
                      : (index == widget.userIds.length - 1)
                          ? widget.lastItemPadding ?? widget.itemPadding
                          : widget.itemPadding,
                  itemBuilder: widget.itemBuilder,
                  avatarBuilder: widget.avatarBuilder,
                  nameBuilder: widget.nameBuilder,
                  captionBuilder: widget.captionBuilder,
                  actionWidgetsBuilder: widget.actionWidgetsBuilder,
                  onPressed: widget.onPressedUser,
                )
              : PeamanUsersListItem.roundedByUid(
                  userId: userId,
                  padding: index == 0
                      ? widget.firstItemPadding ?? widget.itemPadding
                      : (index == widget.userIds.length - 1)
                          ? widget.lastItemPadding ?? widget.itemPadding
                          : widget.itemPadding,
                  itemBuilder: widget.itemBuilder,
                  avatarBuilder: widget.avatarBuilder,
                  nameBuilder: widget.nameBuilder,
                  onPressed: widget.onPressedUser,
                );
        },
      ),
    );
  }

  Widget _byUsersBuilder() {
    final thisUsers =
        widget.filterBuilder?.call(context, ref, widget.users) ?? widget.users;

    return SizedBox(
      height: (widget.type == _Type.roundedByUids ||
                  widget.type == _Type.roundedByUsers) &&
              widget.scrollDirection == Axis.horizontal
          ? widget.height.h
          : null,
      child: ListView.builder(
        itemCount: thisUsers.length,
        scrollDirection: widget.scrollDirection,
        physics: widget.physics,
        itemBuilder: (context, index) {
          final user = thisUsers[index];

          return widget.type == _Type.expandedByUsers
              ? PeamanUsersListItem.expandedByUser(
                  user: user,
                  padding: index == 0
                      ? widget.firstItemPadding ?? widget.itemPadding
                      : (index == thisUsers.length - 1)
                          ? widget.lastItemPadding ?? widget.itemPadding
                          : widget.itemPadding,
                  itemBuilder: widget.itemBuilder,
                  avatarBuilder: widget.avatarBuilder,
                  nameBuilder: widget.nameBuilder,
                  captionBuilder: widget.captionBuilder,
                  actionWidgetsBuilder: widget.actionWidgetsBuilder,
                  onPressed: widget.onPressedUser,
                )
              : PeamanUsersListItem.roundedByUser(
                  user: user,
                  padding: index == 0
                      ? widget.firstItemPadding ?? widget.itemPadding
                      : (index == thisUsers.length - 1)
                          ? widget.lastItemPadding ?? widget.itemPadding
                          : widget.itemPadding,
                  itemBuilder: widget.itemBuilder,
                  avatarBuilder: widget.avatarBuilder,
                  nameBuilder: widget.nameBuilder,
                  onPressed: widget.onPressedUser,
                );
        },
      ),
    );
  }
}
