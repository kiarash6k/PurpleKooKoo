import 'dart:async';

import 'package:flutter/material.dart';

import '../app_services.dart';
import '../core/format.dart';
import '../core/theme.dart';
import 'alarm_form_screen.dart';
import 'alarms_screen.dart';
import 'dashboard_screen.dart';
import 'markets_screen.dart';
import 'settings_screen.dart';

/// Bottom-navigation shell hosting the four main tabs.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;
  StreamSubscription<TriggeredAlarm>? _sub;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sub ??= AppScope.of(context).triggered.listen((event) {
      if (!mounted) return;
      final (alarm, price) = event;
      final verb = alarm.direction.name == 'above' ? 'rose above' : 'fell below';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${alarm.symbol} $verb ${formatPrice(alarm.target)} '
            '(now ${formatPrice(price)})',
          ),
          duration: const Duration(seconds: 6),
        ),
      );
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> _newAlarm([String? symbol]) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => AlarmFormScreen(initialSymbol: symbol),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final tabs = [
      DashboardScreen(
        onOpenMarkets: () => setState(() => _index = 1),
        onOpenAlarms: () => setState(() => _index = 2),
        onNewAlarm: _newAlarm,
        onOpenCoin: _newAlarm,
      ),
      MarketsScreen(onOpenCoin: _newAlarm),
      AlarmsScreen(onNewAlarm: _newAlarm),
      const SettingsScreen(),
    ];
    return AppBackground(
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: IndexedStack(index: _index, children: tabs),
        ),
        floatingActionButton: _index == 3
            ? null
            : FloatingActionButton.extended(
                onPressed: _newAlarm,
                icon: const Icon(Icons.add_alert_rounded),
                label: const Text('New alarm'),
              ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard_rounded),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(Icons.candlestick_chart_outlined),
              selectedIcon: Icon(Icons.candlestick_chart_rounded),
              label: 'Markets',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              selectedIcon: Icon(Icons.notifications_rounded),
              label: 'Alarms',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
