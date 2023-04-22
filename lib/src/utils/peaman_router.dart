import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanRouter {
  static Route onGenerateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case PeamanWrapper.route:
        return buildRoute(
          settings,
          const PeamanWrapper(),
        );

      // <---------------- AUTH START ---------------->

      case PeamanLoginScreen.route:
        return buildRoute(
          settings,
          const PeamanLoginScreen(),
        );

      case PeamanSignUpScreen.route:
        return buildRoute(
          settings,
          const PeamanSignUpScreen(),
        );

      // <---------------- AUTH END ---------------->

      // <---------------- CHAT START ---------------->

      case PeamanChatsListScreen.route:
        return buildRoute(
          settings,
          const PeamanChatsListScreen(),
        );

      case PeamanChatConversationScreen.route:
        final arguments = settings.arguments as PeamanChatConversationArgs;
        return buildRoute(
          settings,
          arguments.chatId.trim().isNotEmpty
              ? PeamanChatConversationScreen.byChatId(
                  chatId: arguments.chatId,
                )
              : PeamanChatConversationScreen.byUserIds(
                  userIds: arguments.userIds,
                  chatType: arguments.chatType,
                ),
        );

      case PeamanViewChatMediasFilesLinksScreen.route:
        final arguments =
            settings.arguments as PeamanViewChatMediasFilesLinksScreenArgs;
        return buildRoute(
          settings,
          PeamanViewChatMediasFilesLinksScreen(
            chatId: arguments.chatId,
          ),
        );

      case PeamanUsersSearchScreen.route:
        final arguments = settings.arguments as PeamanUsersSearchArgs?;
        return buildRoute(
          settings,
          PeamanUsersSearchScreen(
            searchUsersGlobally: arguments?.searchUsersGlobally ?? false,
            onPressedUser: arguments?.onPressedUser,
          ),
        );

      case PeamanViewPicturesScreen.route:
        final arguments = settings.arguments as PeamanViewPicturesArgs;
        return buildRoute(
          settings,
          PeamanViewPicturesScreen(
            pictures: arguments.pictures,
            activeIndex: arguments.activeIndex,
            downloadable: arguments.downloadable,
          ),
        );

      // <---------------- CHAT END ---------------->

      // <---------------- FEED START ---------------->

      case PeamanTimelineFeedsScreen.route:
        return buildRoute(
          settings,
          const PeamanTimelineFeedsScreen(),
        );

      case PeamanCreateFeedScreen.route:
        final arguments = settings.arguments as PeamanCreateFeedScreenArgs?;
        return buildRoute(
          settings,
          PeamanCreateFeedScreen(
            feedToEdit: arguments?.feedToEdit,
          ),
        );

      // <---------------- FEED END ---------------->

      default:
        return buildRoute(
          settings,
          const PeamanWrapper(),
        );
    }
  }

  static Route buildRoute(
    final RouteSettings settings,
    final Widget widget,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
