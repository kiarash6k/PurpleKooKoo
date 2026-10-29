import 'package:flutter/material.dart';

import '../app_services.dart';
import '../widgets/common.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    final theme = Theme.of(context);
    return ListenableBuilder(
      listenable: app.settings,
      builder: (context, _) {
        final settings = app.settings;
        return ContentWidth(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 120),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Text(
                  'Settings',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SectionHeader('Appearance'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment(
                      value: ThemeMode.system,
                      icon: Icon(Icons.brightness_auto_rounded),
                      label: Text('System'),
                    ),
                    ButtonSegment(
                      value: ThemeMode.light,
                      icon: Icon(Icons.light_mode_rounded),
                      label: Text('Light'),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      icon: Icon(Icons.dark_mode_rounded),
                      label: Text('Dark'),
                    ),
                  ],
                  selected: {settings.themeMode},
                  onSelectionChanged: (s) => settings.setThemeMode(s.first),
                ),
              ),
              const SectionHeader('Notifications'),
              SwitchListTile(
                title: const Text('Alarm notifications'),
                subtitle: const Text(
                  'Show a notification when a price alarm fires.',
                ),
                value: settings.notificationsEnabled,
                onChanged: (v) async {
                  await settings.setNotificationsEnabled(v);
                  if (v) await app.notifier.requestPermission();
                },
              ),
              const SectionHeader('About'),
              const ListTile(
                leading: Icon(Icons.show_chart_rounded),
                title: Text('Price data'),
                subtitle: Text('KuCoin public API, refreshed every 30 seconds'),
              ),
              const ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: Text('Purple KooKoo'),
                subtitle: Text(
                  'Alarms are checked while the app is open. Prices are '
                  'informational and not financial advice.',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
