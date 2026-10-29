import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_services.dart';
import 'core/theme.dart';
import 'screens/app_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final services = AppServices(prefs: prefs);
  await services.init();
  runApp(PurpleKooKooApp(services: services));
}

class PurpleKooKooApp extends StatefulWidget {
  const PurpleKooKooApp({super.key, required this.services});

  final AppServices services;

  @override
  State<PurpleKooKooApp> createState() => _PurpleKooKooAppState();
}

class _PurpleKooKooAppState extends State<PurpleKooKooApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.services.market.startAutoRefresh();
  }

  /// Pause polling in the background and catch up when the app returns.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final market = widget.services.market;
    if (state == AppLifecycleState.resumed) {
      market.startAutoRefresh();
    } else if (state == AppLifecycleState.paused) {
      market.stopAutoRefresh();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.services.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = widget.services.settings;
    return AppScope(
      services: widget.services,
      child: ListenableBuilder(
        listenable: settings,
        builder: (context, _) => MaterialApp(
          title: 'Purple KooKoo',
          debugShowCheckedModeBanner: false,
          theme: buildTheme(Brightness.light),
          darkTheme: buildTheme(Brightness.dark),
          themeMode: settings.themeMode,
          home: const AppShell(),
        ),
      ),
    );
  }
}
