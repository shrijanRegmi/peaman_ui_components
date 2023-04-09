import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  expandedByUid,
  expandedByUser,
  roundedByUid,
  roundedByUser,
}

class PeamanUsersListItem extends ConsumerStatefulWidget {
  final _Type type;

  final String? userId;
  final PeamanUser? user;
  final EdgeInsets? padding;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? avatarBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? nameBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanUser)? captionBuilder;
  final List<Widget> Function(BuildContext, WidgetRef, PeamanUser)?
      actionWidgetsBuilder;
  final Function(BuildContext, WidgetRef, PeamanUser)? onPressed;

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
  ConsumerState<PeamanUsersListItem> createState() =>
      _PeamanUsersListItemState();
}

class _PeamanUsersListItemState extends ConsumerState<PeamanUsersListItem> {
  @override
  Widget build(BuildContext context) {
    if ((widget.type == _Type.expandedByUid ||
            widget.type == _Type.roundedByUid) &&
        widget.userId != null) {
      final userFuture =
          ref.watch(providerOfSingleUserByIdFuture(widget.userId!));
      return userFuture.when(
        data: (data) {
          return data.when(
            (success) => widget.type == _Type.expandedByUid
                ? _expandedBuilder(success)
                : _roundedBuilder(success),
            (failure) => _loadingBuilder(),
          );
        },
        error: (e, _) => _errorBuilder(e.toString()),
        loading: () => _loadingBuilder(),
      );
    } else if (widget.user != null) {
      return widget.type == _Type.expandedByUser
          ? _expandedBuilder(widget.user!)
          : _roundedBuilder(widget.user!);
    }

    return Container();
  }

  Widget _errorBuilder(final String message) {
    return Center(
      child: PeamanText.subtitle1(message),
    );
  }

  Widget _loadingBuilder() {
    return const SizedBox();
  }

  Widget _expandedBuilder(final PeamanUser user) {
    final userBody = user.bio.isNull || (user.bio?.isEmpty ?? true)
        ? user.country
        : user.bio;
    return InkWell(
      onTap: () => widget.onPressed?.call(context, ref, user),
      child: Padding(
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
        child: Row(
          children: [
            widget.avatarBuilder?.call(context, ref, user) ??
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
                      widget.nameBuilder?.call(context, ref, user) ??
                          PeamanText.subtitle1(
                            user.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      const SizedBox(
                        width: 5.0,
                      ),
                    ],
                  ),
                  widget.captionBuilder?.call(context, ref, user) ??
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
              ...(widget.actionWidgetsBuilder?.call(context, ref, user) ?? []),
          ],
        ),
      ),
    );
  }

  Widget _roundedBuilder(final PeamanUser user) {
    return GestureDetector(
      onTap: () => widget.onPressed?.call(context, ref, user),
      child: Padding(
        padding: widget.padding ?? const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              children: [
                widget.avatarBuilder?.call(context, ref, user) ??
                    PeamanAvatarBuilder.network(
                      user.photo,
                    ),
                const SizedBox(
                  height: 5.0,
                ),
                widget.nameBuilder?.call(context, ref, user) ??
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
