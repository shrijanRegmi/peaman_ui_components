import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanRouter {
  static Route onGenerateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case PeamanRoutes.homeScreen:
        return buildRoute(
          settings,
          const PeamanHome(),
        );
      case PeamanRoutes.loginScreen:
        return buildRoute(
          settings,
          const PeamanLoginScreen(),
        );
      case PeamanRoutes.signUpScreen:
        return buildRoute(
          settings,
          const PeamanSignUpScreen(),
        );
      case PeamanRoutes.chatsListScreen:
        return buildRoute(
          settings,
          const PeamanChatsListScreen(),
        );
      case PeamanRoutes.chatsConvoScreen:
        final arguments = settings.arguments as PeamanChatConversationArgs;

        return buildRoute(
          settings,
          PeamanChatConversationScreen(
            chatId: arguments.chatId,
            friend: arguments.friend,
          ),
        );
      case PeamanRoutes.usersSearchScreen:
        final arguments = settings.arguments as PeamanUsersSearchArgs?;

        return buildRoute(
          settings,
          PeamanUsersSearchScreen(
            searchUsersGlobally: arguments?.searchUsersGlobally ?? false,
          ),
        );
      case PeamanRoutes.viewPicturesScreen:
        final arguments = settings.arguments as PeamanViewPicturesArgs;

        return buildRoute(
          settings,
          PeamanViewPicturesScreen(
            pictures: arguments.pictures,
            activeIndex: arguments.activeIndex,
            downloadable: arguments.downloadable,
          ),
        );
      default:
        return buildRoute(
          settings,
          const PeamanHome(),
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
