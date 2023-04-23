import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerOfPeamanLocalNotification =
    StateNotifierProvider<PeamanLocalNotificationProvider, bool>((ref) {
  return PeamanLocalNotificationProvider();
});

class PeamanLocalNotificationProvider extends StateNotifier<bool> {
  PeamanLocalNotificationProvider() : super(false) {
    initialize();
  }

  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    state = false;
    try {
      const initializationSettingsAndroid = AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );
      const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
      );
      await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    } catch (e) {
      log(e.toString());
    }
    state = true;
  }

  Future<void> showAlertNotification({
    required final String title,
    required final String body,
    final int? id,
    final String channelId = 'channel_id',
    final String channelName = 'channel_name',
    final Importance importance = Importance.defaultImportance,
    final Priority priority = Priority.defaultPriority,
    final bool showProgress = false,
    final int progress = 0,
    final int maxProgress = 0,
  }) async {
    final androidNotificationDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      importance: importance,
      priority: priority,
      showProgress: showProgress,
      progress: progress,
      maxProgress: maxProgress,
    );
    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _flutterLocalNotificationsPlugin.show(
      id ?? DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      notificationDetails,
    );
  }
}
