import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/alarm.dart';
import '../data/ticker.dart';

/// Stores price alarms and decides when they fire.
class AlarmController extends ChangeNotifier {
  AlarmController(this._prefs) {
    final raw = _prefs.getString(_key);
    if (raw != null) {
      try {
        _alarms.addAll(
          (json.decode(raw) as List).map(Alarm.fromJson).whereType<Alarm>(),
        );
      } catch (_) {
        // Corrupt data: start with an empty list rather than crash.
      }
    }
  }

  static const _key = 'alarms';

  final SharedPreferences _prefs;
  final List<Alarm> _alarms = [];

  List<Alarm> get alarms => List.unmodifiable(_alarms);
  List<Alarm> get active => _alarms.where((a) => a.isActive).toList();
  List<Alarm> get triggered => _alarms.where((a) => !a.isActive).toList();

  Future<Alarm> add({
    required String symbol,
    required double target,
    required AlarmDirection direction,
  }) async {
    final now = DateTime.now();
    final alarm = Alarm(
      id: now.microsecondsSinceEpoch.toString(),
      symbol: symbol,
      target: target,
      direction: direction,
      createdAt: now,
    );
    _alarms.insert(0, alarm);
    await _save();
    return alarm;
  }

  Future<void> remove(String id) async {
    _alarms.removeWhere((a) => a.id == id);
    await _save();
  }

  Future<void> rearm(String id) async {
    final i = _alarms.indexWhere((a) => a.id == id);
    if (i == -1) return;
    _alarms[i] = _alarms[i].copyWith(clearTriggered: true);
    await _save();
  }

  Future<void> clearTriggered() async {
    _alarms.removeWhere((a) => !a.isActive);
    await _save();
  }

  /// Marks every active alarm crossed by [tickers] as triggered and returns
  /// them, each paired with the price that fired it.
  List<(Alarm, double)> evaluate(Map<String, Ticker> tickers) {
    final fired = <(Alarm, double)>[];
    final now = DateTime.now();
    for (var i = 0; i < _alarms.length; i++) {
      final alarm = _alarms[i];
      final price = tickers[alarm.symbol]?.last;
      if (!alarm.isActive || price == null || !alarm.isTriggeredBy(price)) {
        continue;
      }
      _alarms[i] = alarm.copyWith(triggeredAt: now);
      fired.add((_alarms[i], price));
    }
    if (fired.isNotEmpty) _save();
    return fired;
  }

  Future<void> _save() async {
    notifyListeners();
    await _prefs.setString(
      _key,
      json.encode(_alarms.map((a) => a.toJson()).toList()),
    );
  }
}
