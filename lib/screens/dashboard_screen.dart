import 'package:flutter/material.dart';

import '../app_services.dart';
import '../core/format.dart';
import '../data/alarm.dart';
import '../data/ticker.dart';
import '../widgets/common.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.onOpenMarkets,
    required this.onOpenAlarms,
    required this.onNewAlarm,
    required this.onOpenCoin,
  });

  final VoidCallback onOpenMarkets;
  final VoidCallback onOpenAlarms;
  final VoidCallback onNewAlarm;
  final ValueChanged<String> onOpenCoin;

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    return ListenableBuilder(
      listenable: Listenable.merge([app.market, app.alarms]),
      builder: (context, _) {
        final market = app.market;
        final favorites = [
          for (final s in market.favorites)
            if (market.tickerFor(s) != null) market.tickerFor(s)!,
        ];
        final movers = (market.tickers.values.where((t) => t.volume > 1e6).toList()
              ..sort((a, b) => b.changePercent.compareTo(a.changePercent)))
            .take(5)
            .toList();
        final active = app.alarms.active;

        return RefreshIndicator(
          onRefresh: market.refresh,
          child: ContentWidth(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 120),
              children: [
                _Header(lastUpdated: market.lastUpdated, loading: market.loading),
                if (market.error != null)
                  ErrorBanner(message: market.error!, onRetry: market.refresh),
                if (!market.hasData && market.error == null)
                  const Padding(
                    padding: EdgeInsets.all(48),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                _AlarmSummary(
                  active: active,
                  prices: market.tickers,
                  onTap: onOpenAlarms,
                  onNew: onNewAlarm,
                ),
                SectionHeader(
                  'Favorites',
                  actionLabel: 'Edit',
                  onAction: onOpenMarkets,
                ),
                SizedBox(
                  height: 150,
                  child: favorites.isEmpty
                      ? const Center(child: Text('Star coins in Markets'))
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: favorites.length,
                          separatorBuilder: (_, _) => const SizedBox(width: 12),
                          itemBuilder: (_, i) => _FavoriteCard(
                            ticker: favorites[i],
                            onTap: () => onOpenCoin(favorites[i].base),
                          ),
                        ),
                ),
                SectionHeader(
                  'Top movers · 24 h',
                  actionLabel: 'See all',
                  onAction: onOpenMarkets,
                ),
                for (final t in movers)
                  _MoverTile(ticker: t, onTap: () => onOpenCoin(t.base)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.lastUpdated, required this.loading});

  final DateTime? lastUpdated;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Row(
        children: [
          Image.asset('assets/images/kookoo.png', height: 36),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  lastUpdated == null
                      ? 'Connecting…'
                      : 'Updated ${timeAgo(lastUpdated!)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (loading)
            const SizedBox.square(
              dimension: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
        ],
      ),
    );
  }
}

class _AlarmSummary extends StatelessWidget {
  const _AlarmSummary({
    required this.active,
    required this.prices,
    required this.onTap,
    required this.onNew,
  });

  final List<Alarm> active;
  final Map<String, Ticker> prices;
  final VoidCallback onTap;
  final VoidCallback onNew;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // The alarm closest to firing, as a percentage distance from its target.
    Alarm? nearest;
    double nearestGap = double.infinity;
    for (final a in active) {
      final price = prices[a.symbol]?.last;
      if (price == null) continue;
      final gap = ((a.target - price) / price).abs();
      if (gap < nearestGap) {
        nearestGap = gap;
        nearest = a;
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GlassCard(
        padding: const EdgeInsets.all(20),
        onTap: active.isEmpty ? onNew : onTap,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Active alarms',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${active.length}',
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    active.isEmpty
                        ? 'Tap to create your first alarm'
                        : nearest == null
                            ? 'Waiting for prices…'
                            : 'Next: ${nearest.symbol} '
                                '${nearest.direction == AlarmDirection.above ? '≥' : '≤'} '
                                '${formatPrice(nearest.target)} '
                                '(${(nearestGap * 100).toStringAsFixed(1)}% away)',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Image.asset('assets/images/alarm1.png', height: 64, color: theme.colorScheme.onSurface),
          ],
        ),
      ),
    );
  }
}

class _FavoriteCard extends StatelessWidget {
  const _FavoriteCard({required this.ticker, required this.onTap});

  final Ticker ticker;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 170,
      child: GlassCard(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CoinIcon(ticker.base, size: 36),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    ticker.base,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                formatPrice(ticker.last),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 6),
            ChangeChip(ticker.changePercent),
          ],
        ),
      ),
    );
  }
}

class _MoverTile extends StatelessWidget {
  const _MoverTile({required this.ticker, required this.onTap});

  final Ticker ticker;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: GlassCard(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            CoinIcon(ticker.base, size: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ticker.base,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    ticker.pair,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  formatPrice(ticker.last),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                ChangeChip(ticker.changePercent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
