import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  expandedByUids,
  expandedByUsers,
  roundedByUids,
  roundedByUsers,
}

class PeamanUsersList extends StatelessWidget {
  final _Type type;

  final List<String> usersIds;
  final List<PeamanUser> users;
  final bool scroll;
  final bool requiredSearch;
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

  const PeamanUsersList.expandedByUids({
    Key? key,
    required this.usersIds,
    this.scroll = false,
    this.initialItemPadding,
    this.itemPadding,
    this.physics = const AlwaysScrollableScrollPhysics(),
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
    this.scroll = false,
    this.initialItemPadding,
    this.itemPadding,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.onPressedUser,
  })  : type = _Type.expandedByUsers,
        usersIds = const [],
        requiredSearch = false,
        onPressedSearch = null,
        scrollDirection = Axis.vertical,
        height = 0.0,
        super(key: key);

  const PeamanUsersList.roundedByUids({
    Key? key,
    required this.usersIds,
    this.requiredSearch = false,
    this.initialItemPadding,
    this.itemPadding,
    this.physics = const AlwaysScrollableScrollPhysics(),
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
        scroll = true,
        super(key: key);

  const PeamanUsersList.roundedByUsers({
    Key? key,
    required this.users,
    this.requiredSearch = false,
    this.initialItemPadding,
    this.itemPadding,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.scrollDirection = Axis.vertical,
    this.avatarBuilder,
    this.nameBuilder,
    this.onPressedUser,
    this.onPressedSearch,
    this.height = 82.0,
  })  : type = _Type.roundedByUsers,
        usersIds = const [],
        actionWidgetsBuilder = null,
        captionBuilder = null,
        scroll = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
    List<String?> list = usersIds;

    if (requiredSearch) {
      list = [null, ...usersIds];
    }

    return SizedBox(
      height: (type == _Type.roundedByUids || type == _Type.roundedByUsers) &&
              scrollDirection == Axis.horizontal
          ? height.h
          : null,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: !scroll,
        scrollDirection: scrollDirection,
        physics: scroll ? physics : const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final userId = list[index];

          if (userId == null) return _searchUserBuilder(context);

          return type == _Type.expandedByUids
              ? PeamanUsersListItem.expandedByUid(
                  userId: userId,
                  padding: index == 0 ? initialItemPadding : itemPadding,
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
        shrinkWrap: !scroll,
        scrollDirection: scrollDirection,
        physics: scroll ? physics : const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final user = list[index];

          if (user == null) return _searchUserBuilder(context);

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
