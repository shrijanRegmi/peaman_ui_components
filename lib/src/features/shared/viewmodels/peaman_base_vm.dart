import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanBaseVM extends ChangeNotifier {
  final BuildContext context;
  PeamanBaseVM({required this.context});

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  BuildContext get globalContext =>
      GlobalContextService.navigatorKey.currentContext ?? context;
  PeamanDialogProvider get dialogProvider => PeamanDialogProvider(context);

  // state watchers - use context
  PeamanAppVM get appVm => context.pwatch<PeamanAppVM>();
  PeamanUser get appUser => context.pwatch<PeamanUser>();
  List<PeamanChat>? get chats => context.pwatch<List<PeamanChat>?>();
  List<PeamanNotification>? get notifications =>
      context.pwatch<List<PeamanNotification>?>();
  List<PeamanFollower> get followers =>
      context.pwatch<List<PeamanFollower>?>() ?? [];
  List<PeamanFollowing> get following =>
      context.pwatch<List<PeamanFollowing>?>() ?? [];
  List<PeamanSentFollowRequest> get sentFollowRequests =>
      context.pwatch<List<PeamanSentFollowRequest>?>() ?? [];
  List<PeamanReceivedFollowRequest> get receivedFollowRequests =>
      context.pwatch<List<PeamanReceivedFollowRequest>?>() ?? [];

  // state readers - use globalContext
  PeamanAppVM get appVmReadOnly => globalContext.pread<PeamanAppVM>();
  PeamanUser get appUserReadOnly => globalContext.pread<PeamanUser>();

  // navigate to other screens
  Future<dynamic> navigateNamed(
    final String route, {
    final Object? arguments,
  }) {
    return context.navigateNamed(route, arguments: arguments);
  }

  // navigate to other screens
  Future<dynamic> navigate(final Widget widget) {
    return context.navigate(widget);
  }

  // goback from one screen
  void popNavigate({final dynamic data}) {
    return Navigator.pop(context, data);
  }

  // log error
  void logError({
    required final String message,
    final bool toast = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (toast) {
      Fluttertoast.showToast(msg: message);
      return;
    }
    // ignore: use_build_context_synchronously
    Flushbar(
      icon: const Icon(
        Icons.priority_high_rounded,
        color: PeamanColors.white,
      ),
      backgroundColor: PeamanColors.red,
      message: message,
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 2),
    ).show(context);
  }

  // log success
  void logSuccess({
    required final String message,
    final bool toast = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (toast) {
      Fluttertoast.showToast(msg: message);
      return;
    }
    // ignore: use_build_context_synchronously
    Flushbar(
      icon: const Icon(
        Icons.check_rounded,
        color: PeamanColors.white,
      ),
      backgroundColor: PeamanColors.green,
      message: message,
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 2),
    ).show(context);
  }

  // log loading
  void logLoading({
    required final String message,
    final bool toast = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (toast) {
      Fluttertoast.showToast(msg: message);
      return;
    }
    // ignore: use_build_context_synchronously
    Flushbar(
      icon: const Center(
        child: PeamanSpinner(
          size: 20.0,
          color: PeamanColors.white,
        ),
      ),
      backgroundColor: PeamanColors.green,
      message: message,
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 2),
    ).show(context);
  }

  // update value of isLoading
  void updateIsLoading(
    final bool newVal, {
    final bool withUnfocus = true,
  }) {
    if (withUnfocus) {
      FocusScope.of(context).unfocus();
    }

    _isLoading = newVal;
    notifyListeners();
  }
}
