import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authUser = context.pwatch<PeamanUser?>();

    if (authUser == null) return const PeamanLoginScreen();
    return const PeamanChatsListScreen(
      searchUsersGlobally: true,
    );
  }
}
