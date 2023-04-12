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
    this.firstItemPadding,
    this.lastItemPadding,
    this.itemPadding,
    this.searchType = PeamanSearchType.none,
    this.selectionType = PeamanSelectionType.single,
    this.physics = const BouncingScrollPhysics(),
    this.expandOnKeyboard = true,
    this.filterBuilder,
    this.searchFilterBuilder,
    this.itemBuilder,
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.selectedItemBuilder,
    this.selectedItemAvatarBuilder,
    this.selectedItemNameBuilder,
    this.selectedItemOverlayBuilder,
    this.searchBarBuilder,
    this.proceedButtonBuilder,
    this.onPressedProceed,
    this.onPressedUser,
  })  : type = _Type.expandedByUids,
        users = const [],
        scrollDirection = Axis.vertical;

  const PeamanUsersListPopup.expandedByUsers({
    super.key,
    required this.users,
    this.title,
    this.firstItemPadding,
    this.lastItemPadding,
    this.itemPadding,
    this.physics = const BouncingScrollPhysics(),
    this.searchType = PeamanSearchType.none,
    this.selectionType = PeamanSelectionType.single,
    this.expandOnKeyboard = true,
    this.filterBuilder,
    this.searchFilterBuilder,
    this.itemBuilder,
    this.avatarBuilder,
    this.nameBuilder,
    this.captionBuilder,
    this.actionWidgetsBuilder,
    this.selectedItemBuilder,
    this.selectedItemAvatarBuilder,
    this.selectedItemNameBuilder,
    this.selectedItemOverlayBuilder,
    this.searchBarBuilder,
    this.proceedButtonBuilder,
    this.onPressedProceed,
    this.onPressedUser,
  })  : type = _Type.expandedByUsers,
        userIds = const [],
        scrollDirection = Axis.vertical;

  final _Type type;
  final PeamanSearchType searchType;
  final PeamanSelectionType selectionType;

  final String? title;
  final List<String> userIds;
  final List<PeamanUser> users;
  final bool expandOnKeyboard;
  final Axis scrollDirection;
  final ScrollPhysics physics;

  final EdgeInsets? firstItemPadding;
  final EdgeInsets? lastItemPadding;
  final EdgeInsets? itemPadding;

  final List<PeamanUser> Function(
    BuildContext,
    WidgetRef,
    List<PeamanUser>,
  )? filterBuilder;
  final List<PeamanUser> Function(
    BuildContext,
    WidgetRef,
    List<PeamanUser>,
  )? searchFilterBuilder;

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

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? selectedItemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? selectedItemAvatarBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? selectedItemNameBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? selectedItemOverlayBuilder;

  final Widget Function(
    BuildContext,
    WidgetRef,
    TextEditingController,
    Function(),
  )? searchBarBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    List<PeamanUser>,
  )? proceedButtonBuilder;

  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? onPressedUser;
  final Function(
    BuildContext,
    WidgetRef,
    List<PeamanUser>,
    Function(),
  )? onPressedProceed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanUsersListBottomsheetState();
}

class _PeamanUsersListBottomsheetState
    extends ConsumerState<PeamanUsersListPopup> {
  bool _isVisible = false;
  final List<PeamanUser> _selectedUsers = [];
  late KeyboardVisibilityController _keyboardVisibilityController;

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardVisibilityController.onChange.listen((event) {
      if (!_isVisible) {
        if (mounted) {
          setState(() {
            _isVisible = event;
          });
        }
      }
    });
  }

  void _handleUserSelect(final PeamanUser user) {
    if (_selectedUsers.map((e) => e.uid).contains(user.uid)) {
      setState(() {
        _selectedUsers.removeWhere((element) => element.uid == user.uid);
      });
    } else {
      setState(() {
        _selectedUsers.add(user);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _isVisible && widget.expandOnKeyboard
          ? ScreenUtil().screenHeight
          : 450.h,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: _isVisible && widget.expandOnKeyboard
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
                      emptyBuilder: (context, ref) => const PeamanEmptyBuilder(
                        subTitle: 'No results found!',
                      ),
                      searchBarBuilder: (context, ref, controller, debounce) {
                        return Column(
                          children: [
                            _searchInputBuilder(
                              controller: controller,
                              debounce: debounce,
                            ).pB(5),
                            if (_selectedUsers.isNotEmpty)
                              _selectedUsersListBuilder(),
                          ],
                        ).pB(10);
                      },
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
      firstItemPadding: widget.firstItemPadding,
      lastItemPadding: widget.lastItemPadding ??
          EdgeInsets.only(
            bottom: _isVisible ? 250.h : 6.w,
            left: 20.w,
            right: 20.w,
            top: 6.w,
          ),
      itemPadding: widget.itemPadding ??
          EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 6.h,
          ),
      avatarBuilder: (context, ref, user) {
        if (!_selectedUsers.map((e) => e.uid).contains(user.uid)) {
          return widget.avatarBuilder?.call(context, ref, user) ??
              PeamanAvatarBuilder.network(
                user.photo,
                size: 45,
              );
        }
        return PeamanAvatarBuilder.network(
          user.photo,
          size: 45,
          overlayWidget:
              widget.selectedItemOverlayBuilder?.call(context, ref, user) ??
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: PeamanColors.secondary.withOpacity(0.5),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ).pad(2.0),
                  ),
        );
      },
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
      onPressedUser: (context, ref, user) {
        context.unfocus();

        if (widget.selectionType == PeamanSelectionType.multi) {
          if (widget.onPressedUser != null) {
            widget.onPressedUser?.call(
              context,
              ref,
              user,
              () => _handleUserSelect(user),
            );
          } else {
            _handleUserSelect(user);
          }
        } else {
          if (widget.onPressedUser != null) {
            widget.onPressedUser?.call(
              context,
              ref,
              user,
              () {},
            );
          }
        }
      },
    );
  }

  Widget _expandedByUsersListBuilder({
    required final List<PeamanUser> users,
  }) {
    return PeamanUsersList.expandedByUsers(
      users: users,
      firstItemPadding: widget.firstItemPadding,
      lastItemPadding: widget.lastItemPadding ??
          EdgeInsets.only(
            bottom: _isVisible ? 250.h : 6.w,
            left: 20.w,
            right: 20.w,
            top: 6.w,
          ),
      itemPadding: widget.itemPadding ??
          EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 6.h,
          ),
      physics: widget.physics,
      avatarBuilder: (context, ref, user) {
        if (!_selectedUsers.map((e) => e.uid).contains(user.uid)) {
          return widget.avatarBuilder?.call(context, ref, user) ??
              PeamanAvatarBuilder.network(
                user.photo,
                size: 45,
              );
        }
        return PeamanAvatarBuilder.network(
          user.photo,
          size: 45,
          overlayWidget:
              widget.selectedItemOverlayBuilder?.call(context, ref, user) ??
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: PeamanColors.secondary.withOpacity(0.5),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ).pad(2.0),
                  ),
        );
      },
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
      onPressedUser: (context, ref, user) {
        context.unfocus();

        if (widget.selectionType == PeamanSelectionType.multi) {
          if (widget.onPressedUser != null) {
            widget.onPressedUser?.call(
              context,
              ref,
              user,
              () => _handleUserSelect(user),
            );
          } else {
            _handleUserSelect(user);
          }
        } else {
          if (widget.onPressedUser != null) {
            widget.onPressedUser?.call(
              context,
              ref,
              user,
              () {},
            );
          }
        }
      },
    );
  }

  Widget _selectedUsersListBuilder() {
    return PeamanUsersList.roundedByUsers(
      users: _selectedUsers,
      physics: widget.physics,
      scrollDirection: Axis.horizontal,
      itemBuilder: widget.selectedItemBuilder,
      nameBuilder: (context, ref, user) =>
          widget.selectedItemNameBuilder?.call(context, ref, user) ??
          PeamanText.caption(
            user.name?.split(' ').first,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
      avatarBuilder: (context, ref, user) =>
          widget.selectedItemNameBuilder?.call(context, ref, user) ??
          PeamanAvatarBuilder.network(
            user.photo,
            overlayWidget:
                widget.selectedItemOverlayBuilder?.call(context, ref, user) ??
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: PeamanColors.secondary.withOpacity(0.5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ).pad(2.0),
                    ),
          ),
      onPressedUser: (context, ref, user) {
        if (widget.selectionType == PeamanSelectionType.multi) {
          if (widget.onPressedUser != null) {
            widget.onPressedUser?.call(
              context,
              ref,
              user,
              () => _handleUserSelect(user),
            );
          } else {
            _handleUserSelect(user);
          }
        } else {
          if (widget.onPressedUser != null) {
            widget.onPressedUser?.call(
              context,
              ref,
              user,
              () {},
            );
          }
        }
      },
    );
  }

  Widget _searchInputBuilder({
    required final TextEditingController controller,
    required final Function() debounce,
  }) {
    return Row(
      children: [
        Expanded(
          child: widget.searchBarBuilder?.call(
                context,
                ref,
                controller,
                debounce,
              ) ??
              PeamanInput(
                hintText: 'Search...',
                height: 40.0,
                requiredPadding: false,
                controller: controller,
                onChanged: (_) => debounce(),
              ),
        ),
        if (_selectedUsers.isNotEmpty)
          SizedBox(
            width: 10.w,
          ),
        if (_selectedUsers.isNotEmpty)
          widget.proceedButtonBuilder?.call(context, ref, _selectedUsers) ??
              PeamanRoundIconButton(
                bgColor: context.theme.colorScheme.primary,
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  size: 16.w,
                  color: context.theme.colorScheme.onPrimary,
                ),
                padding: EdgeInsets.all(10.0.w),
                onPressed: () => widget.onPressedProceed?.call(
                  context,
                  ref,
                  _selectedUsers,
                  () {},
                ),
              ).pB(4),
      ],
    ).pX(15);
  }
}
