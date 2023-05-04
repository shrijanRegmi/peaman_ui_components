import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/shared/views/screens/peaman_splash_screen.dart';

class PeamanWrapper extends StatefulHookConsumerWidget {
  const PeamanWrapper({
    super.key,
    this.falseLoadingDuration,
    this.splashScreen,
    this.loginScreen,
    this.onboardingScreen,
    this.homeScreen,
  });

  final Duration? falseLoadingDuration;
  final Widget? splashScreen;
  final Widget? loginScreen;
  final Widget? onboardingScreen;
  final Widget? homeScreen;

  static const route = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PeamanWrapperState();
}

class _PeamanWrapperState extends ConsumerState<PeamanWrapper> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      widget.falseLoadingDuration ?? const Duration(milliseconds: 5000),
      () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      },
    );
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

    final isSentFollowRequestsLoading =
        ref.watch(providerOfPeamanSentFollowRequests).maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

    final isReceivedFollowRequestsLoading =
        ref.watch(providerOfPeamanReceivedFollowRequests).maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

    final isLocalNotificationInitialised =
        ref.watch(providerOfPeamanLocalNotification);

    final isUserHiddenFeedsLoading =
        ref.watch(providerOfPeamanUserHiddenFeeds).maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

    return !isBlockedUsersLoading &&
        !isBlockedByUsersLoading &&
        isLocalNotificationInitialised &&
        !isUserHiddenFeedsLoading &&
        !isSentFollowRequestsLoading &&
        !isReceivedFollowRequestsLoading;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(providerOfLoggedInUserStream, (previous, next) {
      if (previous != next) {
        next.whenData((value) => ref.invalidate(providerOfLoggedInUser));
      }
    });

    return ref.watch(providerOfLoggedInUserStream).when(
      data: (user) {
        if (_isLoading || !_isInitialLockOpen()) {
          return widget.splashScreen ?? const PeamanSplashScreen();
        }

        if (user != null) {
          if (user.isOnboardingCompleted) {
            return widget.homeScreen ?? const PeamanTimelineFeedsScreen();
          } else {
            return widget.onboardingScreen ?? const PeamanOnboardingScreen();
          }
        }
        return widget.loginScreen ?? const PeamanLoginScreen();
      },
      error: (e, _) {
        return widget.loginScreen ?? const PeamanLoginScreen();
      },
      loading: () {
        return widget.splashScreen ?? const PeamanSplashScreen();
      },
    );
  }
}
