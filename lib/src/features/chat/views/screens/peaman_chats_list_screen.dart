import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatsListScreen extends ConsumerStatefulWidget {
  final bool searchUsersGlobally;

  const PeamanChatsListScreen({
    super.key,
    this.searchUsersGlobally = false,
  });

  static const route = '/peaman_chats_list_screen';

  @override
  ConsumerState<PeamanChatsListScreen> createState() =>
      _PeamanChatsListScreenState();
}

class _PeamanChatsListScreenState extends ConsumerState<PeamanChatsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarBuilder(),
      body: const PeamanChatsList(
        lastItemPadding: EdgeInsets.only(bottom: 100.0),
      ),
      floatingActionButton: const PeamanChatInitiatorButton(),
    );
  }

  PreferredSizeWidget _appbarBuilder() {
    return PeamanAppbar(
      title: PeamanText.heading4(
        'Chats',
        style: GoogleFonts.caveat(),
      ),
      elevation: 0.5,
      centerTitle: false,
      leadingWidth: 0.0,
      leading: const SizedBox(),
      actions: [
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
