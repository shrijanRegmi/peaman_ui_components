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
      case PeamanChatsListScreen.route:
        return buildRoute(
          settings,
          const PeamanChatsListScreen(),
        );
      case PeamanChatConversationScreen.route:
        final arguments = settings.arguments as PeamanChatConversationArgs;

        return buildRoute(
          settings,
          PeamanChatConversationScreen(
            chatId: arguments.chatId,
            chatType: arguments.chatType,
            receiverIds: arguments.receiverIds,
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
