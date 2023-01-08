import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanHome extends StatelessWidget {
  final Widget? authenticatedScreen;
  final Widget? unauthenticatedScreen;

  const PeamanHome({
    super.key,
    this.authenticatedScreen,
    this.unauthenticatedScreen,
  });

  @override
  Widget build(BuildContext context) {
    final authUser = context.pwatch<PeamanUser?>();

    if (authUser == null) {
      return unauthenticatedScreen ?? const PeamanLoginScreen();
    }

    if (authenticatedScreen != null) {
      return authenticatedScreen!;
    } else if (!authUser.onboardingCompleted) {
      return const PeamanOnboardingScreen();
    }
    return const PeamanChatsListScreen(
      searchUsersGlobally: true,
    );
  }
}
