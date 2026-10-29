import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../core/format.dart';
import '../data/alarm.dart';

/// Shows a system notification when an alarm fires.
abstract class AlarmNotifier {
  Future<void> init();

  /// Asks the OS for permission; returns whether notifications are allowed.
  Future<bool> requestPermission();

  Future<void> showTriggered(Alarm alarm, double price);
}

/// Local notifications on Android and iOS. A no-op on the web, where alarms
/// are surfaced inside the app instead.
class LocalAlarmNotifier implements AlarmNotifier {
  final _plugin = FlutterLocalNotificationsPlugin();
  bool _ready = false;

  @override
  Future<void> init() async {
    if (kIsWeb) return;
    try {
      await _plugin.initialize(
        settings: const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          // Permission is requested from Settings / first alarm, not at launch.
          iOS: DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          ),
        ),
      );
      _ready = true;
    } catch (e) {
      debugPrint('Notifications unavailable: $e');
    }
  }

  @override
  Future<bool> requestPermission() async {
    if (!_ready) return false;
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      return await android.requestNotificationsPermission() ?? false;
    }
    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    return await ios?.requestPermissions(alert: true, badge: true, sound: true) ??
        false;
  }

  @override
  Future<void> showTriggered(Alarm alarm, double price) async {
    if (!_ready) return;
    final verb = alarm.direction == AlarmDirection.above ? 'rose above' : 'fell below';
    await _plugin.show(
      id: alarm.id.hashCode & 0x7fffffff,
      title: '${alarm.symbol} price alert',
      body: '${alarm.symbol} $verb ${formatPrice(alarm.target)} USDT '
          '(now ${formatPrice(price)}).',
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'price_alarms',
          'Price alarms',
          channelDescription: 'Alerts when a coin crosses your target price',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }
}
