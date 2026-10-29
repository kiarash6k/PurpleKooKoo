import 'package:flutter/material.dart';

import '../app_services.dart';
import '../core/format.dart';
import '../data/alarm.dart';
import '../widgets/common.dart';

class AlarmsScreen extends StatelessWidget {
  const AlarmsScreen({super.key, required this.onNewAlarm});

  final VoidCallback onNewAlarm;

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    final theme = Theme.of(context);
    return ListenableBuilder(
      listenable: Listenable.merge([app.alarms, app.market]),
      builder: (context, _) {
        final active = app.alarms.active;
        final triggered = app.alarms.triggered;
        return ContentWidth(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 120),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Text(
                  'Alarms',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (active.isEmpty && triggered.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/alarm.png',
                        height: 96,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No alarms yet',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Get notified when a coin reaches your target price.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: onNewAlarm,
                        icon: const Icon(Icons.add_alert_rounded),
                        label: const Text('Create alarm'),
                      ),
                    ],
                  ),
                ),
              if (active.isNotEmpty) const SectionHeader('Active'),
              for (final a in active) _AlarmTile(alarm: a),
              if (triggered.isNotEmpty)
                SectionHeader(
                  'Triggered',
                  actionLabel: 'Clear',
                  onAction: app.alarms.clearTriggered,
                ),
              for (final a in triggered) _AlarmTile(alarm: a),
            ],
          ),
        );
      },
    );
  }
}

class _AlarmTile extends StatelessWidget {
  const _AlarmTile({required this.alarm});

  final Alarm alarm;

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    final theme = Theme.of(context);
    final price = app.market.tickerFor(alarm.symbol)?.last;
    final above = alarm.direction == AlarmDirection.above;
    return Dismissible(
      key: ValueKey(alarm.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 28),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: theme.colorScheme.error,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Icon(Icons.delete_rounded, color: theme.colorScheme.onError),
      ),
      onDismissed: (_) {
        final removed = alarm;
        app.alarms.remove(alarm.id);
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            SnackBar(
              content: Text('${removed.symbol} alarm deleted'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () => app.alarms.add(
                  symbol: removed.symbol,
                  target: removed.target,
                  direction: removed.direction,
                ),
              ),
            ),
          );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              CoinIcon(alarm.symbol, size: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${alarm.symbol} ${above ? '≥' : '≤'} ${formatPrice(alarm.target)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      alarm.isActive
                          ? [
                              alarm.direction.label,
                              if (price != null) 'now ${formatPrice(price)}',
                            ].join(' · ')
                          : 'Triggered ${timeAgo(alarm.triggeredAt!)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (!alarm.isActive)
                IconButton(
                  tooltip: 'Re-arm alarm',
                  onPressed: () => app.alarms.rearm(alarm.id),
                  icon: const Icon(Icons.replay_rounded),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
