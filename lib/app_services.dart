import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/alarm.dart';
import 'data/market_repository.dart';
import 'services/notification_service.dart';
import 'state/alarm_controller.dart';
import 'state/market_controller.dart';
import 'state/settings_controller.dart';

/// An alarm that just fired, with the price that triggered it.
typedef TriggeredAlarm = (Alarm alarm, double price);

/// Wires the controllers together and exposes them to the widget tree.
class AppServices {
  AppServices({
    required SharedPreferences prefs,
    MarketRepository? repository,
    AlarmNotifier? notifier,
    Duration refreshInterval = const Duration(seconds: 30),
  })  : notifier = notifier ?? LocalAlarmNotifier(),
        settings = SettingsController(prefs),
        alarms = AlarmController(prefs),
        market = MarketController(
          repository ?? MarketRepository(),
          prefs,
          refreshInterval: refreshInterval,
        ) {
    market.onData = _onMarketData;
  }

  final AlarmNotifier notifier;
  final SettingsController settings;
  final AlarmController alarms;
  final MarketController market;

  final _triggered = StreamController<TriggeredAlarm>.broadcast();

  /// Emits whenever an alarm fires, for in-app banners.
  Stream<TriggeredAlarm> get triggered => _triggered.stream;

  Future<void> init() => notifier.init();

  void _onMarketData(Map tickers) {
    final fired = alarms.evaluate(market.tickers);
    for (final (alarm, price) in fired) {
      _triggered.add((alarm, price));
      if (settings.notificationsEnabled) {
        notifier.showTriggered(alarm, price);
      }
    }
  }

  void dispose() {
    market.dispose();
    alarms.dispose();
    settings.dispose();
    _triggered.close();
  }
}

class AppScope extends InheritedWidget {
  const AppScope({super.key, required this.services, required super.child});

  final AppServices services;

  static AppServices of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'No AppScope found in context');
    return scope!.services;
  }

  @override
  bool updateShouldNotify(AppScope oldWidget) => services != oldWidget.services;
}
