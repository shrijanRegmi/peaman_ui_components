import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatListScreenHeader extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const PeamanChatListScreenHeader({
    super.key,
    this.searchUsersGlobally = true,
    this.titleText,
    this.title,
    this.backgroundColor,
    this.leading,
    this.leadingWidth,
    this.centerTitle = true,
    this.elevation = 4.0,
    this.height = kToolbarHeight - 10,
    this.onPressedTitle,
    this.onPressedLeading,
    this.actions = const [],
  });

  final bool searchUsersGlobally;
  final String? titleText;
  final Widget? title;
  final Color? backgroundColor;
  final double elevation;
  final double height;
  final double? leadingWidth;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget> actions;
  final Function(Function())? onPressedTitle;
  final Function(Function())? onPressedLeading;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanChatListScreenHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}

class _PeamanChatListScreenHeaderState
    extends ConsumerState<PeamanChatListScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return PeamanAppbar(
      titleText: widget.titleText,
      title: widget.title ??
          PeamanText.heading4(
            'Chats',
            style: GoogleFonts.caveat(),
          ),
      backgroundColor: widget.backgroundColor,
      onPressedTitle: widget.onPressedTitle,
      onPressedLeading: widget.onPressedLeading,
      elevation: 0.5,
      leadingWidth: widget.leadingWidth,
      leading: widget.leading ??
          Center(
            child: PeamanRoundIconButton(
              padding: EdgeInsets.all(7.w),
              onPressed: context.pop,
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 16.w,
              ),
            ),
          ),
      centerTitle: widget.centerTitle,
      actions: widget.actions.isNotEmpty
          ? widget.actions
          : [
              Center(
                child: PeamanRoundIconButton(
                  padding: EdgeInsets.all(7.w),
                  onPressed: _gotoUsersSearchScreen,
                  icon: SvgPicture.asset(
                    'assets/svgs/outlined_search.svg',
                    package: 'peaman_ui_components',
                    color: context.isDarkMode
                        ? PeamanColors.white70
                        : PeamanColors.black,
                    width: 16.w,
                  ),
                ).pR(10.0),
              ),
            ],
    );
  }

  void _gotoUsersSearchScreen() {
    context.pushNamed(
      PeamanUsersSearchScreen.route,
      arguments: PeamanUsersSearchArgs(
        searchUsersGlobally: widget.searchUsersGlobally,
        onPressedUser: (user) {
          final appUser = ref.read(providerOfLoggedInUser);
          context
            ..pop()
            ..pushNamed(
              PeamanChatConversationScreen.route,
              arguments: PeamanChatConversationArgs.byUserIds(
                userIds: [user.uid!, appUser.uid!]..sort(),
                chatType: PeamanChatType.oneToOne,
              ),
            );
        },
      ),
    );
  }
}
