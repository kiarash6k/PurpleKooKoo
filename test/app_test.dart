import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:purple_kookoo/app_services.dart';
import 'package:purple_kookoo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers.dart';

void main() {
  late AppServices services;

  Future<void> pumpApp(WidgetTester tester, FakeRepository repo) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    services = AppServices(
      prefs: prefs,
      repository: repo,
      notifier: FakeNotifier(),
      refreshInterval: const Duration(hours: 1),
    );
    tester.view.physicalSize = const Size(1179, 2556);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(PurpleKooKooApp(services: services));
    await tester.pump();
    await tester.pump();
  }

  final prices = {
    'BTC': ticker('BTC', 78859.6, change: -2.96),
    'ETH': ticker('ETH', 2500, change: 1.5),
    'DOGE': ticker('DOGE', 0.15, change: 12, volume: 9e6),
  };

  testWidgets('dashboard shows live favorites and movers', (tester) async {
    await pumpApp(tester, FakeRepository(prices));
    expect(find.text('Dashboard'), findsWidgets);
    expect(find.text('78,859.60'), findsWidgets);
    expect(find.text('-2.96%'), findsWidgets);
    expect(find.text('Top movers · 24 h'), findsOneWidget);
    // Unmount so the periodic refresh timer is cancelled.
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('shows an error banner when prices cannot load', (tester) async {
    await pumpApp(tester, FakeRepository({})..fail = true);
    expect(find.text('offline'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('creating an alarm updates the dashboard count', (tester) async {
    await pumpApp(tester, FakeRepository(prices));
    await tester.tap(find.text('New alarm'));
    await tester.pumpAndSettle();
    expect(find.text('BTC / USDT'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), '50000');
    await tester.tap(find.text('Add alarm'));
    await tester.pumpAndSettle();
    // Default direction is "above", which 50 000 < 78 859 violates.
    expect(find.text('Target must be above the current price'), findsOneWidget);

    await tester.tap(find.text('Drops below'));
    await tester.pump();
    await tester.tap(find.text('Add alarm'));
    await tester.pumpAndSettle();

    expect(services.alarms.active, hasLength(1));
    expect(find.text('1'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('markets search filters the list', (tester) async {
    await pumpApp(tester, FakeRepository(prices));
    await tester.tap(find.text('Markets').last);
    await tester.pumpAndSettle();
    expect(find.text('DOGE'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'eth');
    await tester.pumpAndSettle();
    expect(find.text('ETH'), findsOneWidget);
    expect(find.text('DOGE'), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });
}
