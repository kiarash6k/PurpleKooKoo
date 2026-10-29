import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_test/flutter_test.dart';
import 'package:purple_kookoo/app_services.dart';
import 'package:purple_kookoo/core/coins.dart';
import 'package:purple_kookoo/data/alarm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers.dart';

Future<AppServices> makeServices({
  Map<String, Object> initial = const {},
  FakeRepository? repo,
  FakeNotifier? notifier,
}) async {
  SharedPreferences.setMockInitialValues(initial);
  final prefs = await SharedPreferences.getInstance();
  return AppServices(
    prefs: prefs,
    repository: repo ?? FakeRepository({'BTC': ticker('BTC', 100)}),
    notifier: notifier ?? FakeNotifier(),
  );
}

void main() {
  test('refresh loads prices and records the update time', () async {
    final app = await makeServices();
    await app.market.refresh();
    expect(app.market.tickerFor('BTC')!.last, 100);
    expect(app.market.error, isNull);
    expect(app.market.lastUpdated, isNotNull);
  });

  test('a failed refresh keeps the last prices and reports the error', () async {
    final repo = FakeRepository({'BTC': ticker('BTC', 100)});
    final app = await makeServices(repo: repo);
    await app.market.refresh();
    repo.fail = true;
    await app.market.refresh();
    expect(app.market.error, 'offline');
    expect(app.market.tickerFor('BTC'), isNotNull);
    repo.fail = false;
    await app.market.refresh();
    expect(app.market.error, isNull);
  });

  test('favorites default, toggle and persist', () async {
    final app = await makeServices();
    expect(app.market.favorites, defaultFavorites);
    await app.market.toggleFavorite('BTC');
    await app.market.toggleFavorite('DOGE');
    expect(app.market.isFavorite('BTC'), isFalse);
    expect(app.market.isFavorite('DOGE'), isTrue);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getStringList('favorites'), contains('DOGE'));
  });

  test('alarms persist across controller instances', () async {
    final app = await makeServices();
    await app.alarms.add(
      symbol: 'BTC',
      target: 150,
      direction: AlarmDirection.above,
    );
    final prefs = await SharedPreferences.getInstance();
    final reloaded = AppServices(
      prefs: prefs,
      repository: FakeRepository({}),
      notifier: FakeNotifier(),
    );
    expect(reloaded.alarms.alarms.single.target, 150);
  });

  test('corrupt stored alarms do not crash the app', () async {
    final app = await makeServices(initial: {'alarms': '{{{'});
    expect(app.alarms.alarms, isEmpty);
  });

  test('an alarm fires once, notifies, and can be re-armed', () async {
    final repo = FakeRepository({'BTC': ticker('BTC', 100)});
    final notifier = FakeNotifier();
    final app = await makeServices(repo: repo, notifier: notifier);
    final events = <TriggeredAlarm>[];
    app.triggered.listen(events.add);

    final alarm = await app.alarms.add(
      symbol: 'BTC',
      target: 120,
      direction: AlarmDirection.above,
    );
    await app.market.refresh();
    expect(app.alarms.active, hasLength(1));
    expect(notifier.shown, isEmpty);

    repo.tickers = {'BTC': ticker('BTC', 125)};
    await app.market.refresh();
    await Future<void>.delayed(Duration.zero);
    expect(app.alarms.active, isEmpty);
    expect(app.alarms.triggered, hasLength(1));
    expect(notifier.shown.single.$2, 125);
    expect(events, hasLength(1));

    // Fires only once while the price stays above the target.
    await app.market.refresh();
    expect(notifier.shown, hasLength(1));

    await app.alarms.rearm(alarm.id);
    expect(app.alarms.active, hasLength(1));
  });

  test('notifications can be switched off', () async {
    final repo = FakeRepository({'BTC': ticker('BTC', 130)});
    final notifier = FakeNotifier();
    final app = await makeServices(repo: repo, notifier: notifier);
    await app.settings.setNotificationsEnabled(false);
    await app.alarms.add(symbol: 'BTC', target: 120, direction: AlarmDirection.above);
    await app.market.refresh();
    expect(app.alarms.triggered, hasLength(1));
    expect(notifier.shown, isEmpty);
  });

  test('theme mode persists', () async {
    final app = await makeServices();
    await app.settings.setThemeMode(ThemeMode.dark);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('themeMode'), 'dark');
  });
}
