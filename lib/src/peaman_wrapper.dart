import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/auth/providers/peaman_auth_provider.dart';

class PeamanWrapper extends StatefulHookConsumerWidget {
  const PeamanWrapper({super.key});

  static const route = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PeamanWrapperState();
}

class _PeamanWrapperState extends ConsumerState<PeamanWrapper> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(providerOfLoggedInUserStream).when(
      data: (user) {
        if (user != null) {
          if (user.isOnboardingCompleted) {
            return const PeamanChatsListScreen(
              searchUsersGlobally: true,
            );
          } else {
            return const PeamanOnboardingScreen();
          }
        }
        return const PeamanLoginScreen();
      },
      error: (e, _) {
        return const PeamanLoginScreen();
      },
      loading: () {
        return const PeamanLoginScreen();
      },
    );
  }
}
