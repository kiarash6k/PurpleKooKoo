import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// User preferences: theme and notifications.
class SettingsController extends ChangeNotifier {
  SettingsController(this._prefs)
      : _themeMode = ThemeMode.values.firstWhere(
          (m) => m.name == _prefs.getString(_themeKey),
          orElse: () => ThemeMode.system,
        ),
        _notifications = _prefs.getBool(_notificationsKey) ?? true;

  static const _themeKey = 'themeMode';
  static const _notificationsKey = 'notifications';

  final SharedPreferences _prefs;
  ThemeMode _themeMode;
  bool _notifications;

  ThemeMode get themeMode => _themeMode;
  bool get notificationsEnabled => _notifications;

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    await _prefs.setString(_themeKey, mode.name);
  }

  Future<void> setNotificationsEnabled(bool value) async {
    _notifications = value;
    notifyListeners();
    await _prefs.setBool(_notificationsKey, value);
  }
}
