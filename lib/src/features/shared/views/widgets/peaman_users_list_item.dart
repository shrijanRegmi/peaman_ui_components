import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  expandedByUid,
  expandedByUser,
  roundedByUid,
  roundedByUser,
}

class PeamanUsersListItem extends StatefulWidget {
  final _Type type;

  final String? userId;
  final PeamanUser? user;
  final EdgeInsets? padding;
  final Widget Function(PeamanUser)? avatarBuilder;
  final Widget Function(PeamanUser)? nameBuilder;
  final Widget Function(PeamanUser)? captionBuilder;
  final List<Widget> Function(PeamanUser)? actionWidgetsBuilder;
  final Function(PeamanUser)? onPressed;

  const PeamanUsersListItem.expandedByUid({
    Key? key,
    required this.userId,
    this.padding,
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.onPressed,
  })  : type = _Type.expandedByUid,
        user = null,
        super(key: key);

  const PeamanUsersListItem.expandedByUser({
    Key? key,
    required this.user,
    this.padding,
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.onPressed,
  })  : type = _Type.expandedByUser,
        userId = null,
        super(key: key);

  const PeamanUsersListItem.roundedByUid({
    Key? key,
    required this.userId,
    this.padding,
    this.avatarBuilder,
    this.nameBuilder,
    this.onPressed,
  })  : type = _Type.roundedByUid,
        user = null,
        actionWidgetsBuilder = null,
        captionBuilder = null,
        super(key: key);

  const PeamanUsersListItem.roundedByUser({
    Key? key,
    required this.user,
    this.padding,
    this.avatarBuilder,
    this.nameBuilder,
    this.onPressed,
  })  : type = _Type.roundedByUser,
        userId = null,
        actionWidgetsBuilder = null,
        captionBuilder = null,
        super(key: key);

  @override
  State<PeamanUsersListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<PeamanUsersListItem> {
  Future<PeamanUser>? _userFuture;

  @override
  void initState() {
    super.initState();
    if (widget.type == _Type.expandedByUid ||
        widget.type == _Type.roundedByUid) {
      _userFuture = PUserProvider.getUserById(
        uid: widget.userId!,
      );
    }
  }

  @override
  void didUpdateWidget(covariant PeamanUsersListItem oldWidget) {
    if (widget.userId != oldWidget.userId) {
      _userFuture = PUserProvider.getUserById(
        uid: widget.userId!,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.type == _Type.expandedByUid ||
            widget.type == _Type.roundedByUid) &&
        _userFuture != null) {
      return PeamanUserFetcher.singleFuture(
        userFuture: _userFuture,
        singleBuilder: (user) {
          return widget.type == _Type.expandedByUid
              ? _expandedBuilder(user)
              : _roundedBuilder(user);
        },
      );
    } else if (widget.user != null) {
      return widget.type == _Type.expandedByUser
          ? _expandedBuilder(widget.user!)
          : _roundedBuilder(widget.user!);
    }

    return Container();
  }

  Widget _expandedBuilder(final PeamanUser user) {
    final userBody = user.bio == null || (user.bio?.isEmpty ?? true)
        ? user.country
        : user.bio;
    return InkWell(
      onTap: () => widget.onPressed?.call(user),
      child: Padding(
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
        child: Row(
          children: [
            widget.avatarBuilder?.call(user) ??
                PeamanAvatarBuilder.network(
                  user.photo,
                ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      widget.nameBuilder?.call(user) ??
                          PeamanText.subtitle1(
                            user.name,
                          ),
                      const SizedBox(
                        width: 5.0,
                      ),
                    ],
                  ),
                  widget.captionBuilder?.call(user) ??
                      PeamanText.body2(
                        userBody,
                        limit: 60,
                      ),
                ],
              ),
            ),
            if (widget.actionWidgetsBuilder != null)
              const SizedBox(
                width: 10.0,
              ),
            if (widget.actionWidgetsBuilder != null)
              ...(widget.actionWidgetsBuilder?.call(user) ?? []),
          ],
        ),
      ),
    );
  }

  Widget _roundedBuilder(final PeamanUser user) {
    return GestureDetector(
      onTap: () => widget.onPressed?.call(user),
      child: Padding(
        padding: widget.padding ?? const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              children: [
                widget.avatarBuilder?.call(user) ??
                    PeamanAvatarBuilder.network(
                      user.photo,
                    ),
                const SizedBox(
                  height: 5.0,
                ),
                PeamanText.body2(
                  user.name,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
