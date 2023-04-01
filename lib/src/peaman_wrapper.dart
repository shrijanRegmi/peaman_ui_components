import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/shared/views/screens/peaman_splash_screen.dart';

class PeamanWrapper extends StatefulHookConsumerWidget {
  const PeamanWrapper({super.key});

  static const route = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PeamanWrapperState();
}

class _PeamanWrapperState extends ConsumerState<PeamanWrapper> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  bool _isInitialLockOpen() {
    final isBlockedUsersLoading =
        ref.watch(providerOfPeamanBlockedUsersStream).maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
    final isBlockedByUsersLoading =
        ref.watch(providerOfPeamanBlockedByUsersStream).maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

    return !isBlockedUsersLoading && !isBlockedByUsersLoading;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(providerOfPeamanError, (previous, next) {
      if (previous != next && next != null) {
        showPeamanErrorDialog(
          context: context,
          error: next,
        );
      }
    });

    return ref.watch(providerOfLoggedInUserStream).when(
      data: (user) {
        if (_isLoading || !_isInitialLockOpen()) {
          return const PeamanSplashScreen();
        }

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
        return const PeamanSplashScreen();
      },
    );
  }
}
