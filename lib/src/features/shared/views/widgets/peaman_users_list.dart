import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  expandedByUids,
  expandedByUsers,
  roundedByUids,
  roundedByUsers,
}

class PeamanUsersList extends ConsumerWidget {
  final _Type type;

  final List<String> userIds;
  final List<PeamanUser> users;
  final bool requiredSearch;
  final Axis scrollDirection;
  final ScrollPhysics physics;
  final EdgeInsets? initialItemPadding;
  final EdgeInsets? itemPadding;
  final double height;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? avatarBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? nameBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? captionBuilder;
  final List<Widget> Function(BuildContext, WidgetRef, PeamanUser)?
      actionWidgetsBuilder;
  final Function(BuildContext, WidgetRef, PeamanUser)? onPressedUser;
  final Function()? onPressedSearch;

  const PeamanUsersList.expandedByUids({
    Key? key,
    required this.userIds,
    this.initialItemPadding,
    this.itemPadding,
    this.physics = const BouncingScrollPhysics(),
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.onPressedUser,
  })  : type = _Type.expandedByUids,
        users = const [],
        requiredSearch = false,
        onPressedSearch = null,
        scrollDirection = Axis.vertical,
        height = 0.0,
        super(key: key);

  const PeamanUsersList.expandedByUsers({
    Key? key,
    required this.users,
    this.initialItemPadding,
    this.itemPadding,
    this.physics = const BouncingScrollPhysics(),
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.onPressedUser,
  })  : type = _Type.expandedByUsers,
        userIds = const [],
        requiredSearch = false,
        onPressedSearch = null,
        scrollDirection = Axis.vertical,
        height = 0.0,
        super(key: key);

  const PeamanUsersList.roundedByUids({
    Key? key,
    required this.userIds,
    this.requiredSearch = false,
    this.initialItemPadding,
    this.itemPadding,
    this.physics = const BouncingScrollPhysics(),
    this.scrollDirection = Axis.vertical,
    this.avatarBuilder,
    this.nameBuilder,
    this.onPressedUser,
    this.onPressedSearch,
    this.height = 82.0,
  })  : type = _Type.roundedByUids,
        users = const [],
        actionWidgetsBuilder = null,
        captionBuilder = null,
        super(key: key);

  const PeamanUsersList.roundedByUsers({
    Key? key,
    required this.users,
    this.requiredSearch = false,
    this.initialItemPadding,
    this.itemPadding,
    this.physics = const BouncingScrollPhysics(),
    this.scrollDirection = Axis.vertical,
    this.avatarBuilder,
    this.nameBuilder,
    this.onPressedUser,
    this.onPressedSearch,
    this.height = 82.0,
  })  : type = _Type.roundedByUsers,
        userIds = const [],
        actionWidgetsBuilder = null,
        captionBuilder = null,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (type) {
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
    List<String?> list = userIds;

    if (requiredSearch) {
      list = [null, ...userIds];
    }

    return SizedBox(
      height: (type == _Type.roundedByUids || type == _Type.roundedByUsers) &&
              scrollDirection == Axis.horizontal
          ? height.h
          : null,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: scrollDirection,
        physics: physics,
        itemBuilder: (context, index) {
          final userId = list[index];

          if (userId.isNull) return _searchUserBuilder(context);

          return type == _Type.expandedByUids
              ? PeamanUsersListItem.expandedByUid(
                  userId: userId,
                  padding: index == 0
                      ? initialItemPadding ?? itemPadding
                      : itemPadding,
                  avatarBuilder: avatarBuilder,
                  nameBuilder: nameBuilder,
                  captionBuilder: captionBuilder,
                  actionWidgetsBuilder: actionWidgetsBuilder,
                  onPressed: onPressedUser,
                )
              : PeamanUsersListItem.roundedByUid(
                  userId: userId,
                  padding: index == 0 ? initialItemPadding : itemPadding,
                  avatarBuilder: avatarBuilder,
                  nameBuilder: nameBuilder,
                  onPressed: onPressedUser,
                );
        },
      ),
    );
  }

  Widget _byUsersBuilder() {
    List<PeamanUser?> list = users;

    if (requiredSearch) {
      list = [null, ...users];
    }

    return SizedBox(
      height: (type == _Type.roundedByUids || type == _Type.roundedByUsers) &&
              scrollDirection == Axis.horizontal
          ? height.h
          : null,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: scrollDirection,
        itemBuilder: (context, index) {
          final user = list[index];

          if (user.isNull) return _searchUserBuilder(context);

          return type == _Type.expandedByUsers
              ? PeamanUsersListItem.expandedByUser(
                  user: user,
                  padding: index == 0 ? initialItemPadding : itemPadding,
                  avatarBuilder: avatarBuilder,
                  nameBuilder: nameBuilder,
                  captionBuilder: captionBuilder,
                  actionWidgetsBuilder: actionWidgetsBuilder,
                  onPressed: onPressedUser,
                )
              : PeamanUsersListItem.roundedByUser(
                  user: user,
                  padding: index == 0 ? initialItemPadding : itemPadding,
                  avatarBuilder: avatarBuilder,
                  nameBuilder: nameBuilder,
                  onPressed: onPressedUser,
                );
        },
      ),
    );
  }

  Widget _searchUserBuilder(final BuildContext context) {
    if (type == _Type.expandedByUids || type == _Type.expandedByUsers) {
      return Container();
    }

    return GestureDetector(
      onTap: onPressedSearch,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: PeamanColors.lightGrey,
              ),
              child: const Center(
                child: Icon(
                  Icons.search_rounded,
                  size: 30.0,
                  color: Colors.black45,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Search',
              style: TextStyle(
                color: PeamanColors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
