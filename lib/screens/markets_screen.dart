import 'package:flutter/material.dart';

import '../app_services.dart';
import '../core/format.dart';
import '../data/ticker.dart';
import '../widgets/common.dart';

enum MarketSort {
  volume('Volume'),
  gainers('Gainers'),
  losers('Losers'),
  name('A–Z');

  const MarketSort(this.label);
  final String label;
}

class MarketsScreen extends StatefulWidget {
  const MarketsScreen({super.key, required this.onOpenCoin});

  final ValueChanged<String> onOpenCoin;

  @override
  State<MarketsScreen> createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen> {
  String _query = '';
  MarketSort _sort = MarketSort.volume;
  bool _favoritesOnly = false;

  List<Ticker> _visible(Iterable<Ticker> all, Set<String> favorites) {
    final q = _query.trim().toUpperCase();
    final list = all
        .where((t) => q.isEmpty || t.base.contains(q))
        .where((t) => !_favoritesOnly || favorites.contains(t.base))
        .toList();
    switch (_sort) {
      case MarketSort.volume:
        list.sort((a, b) => b.volume.compareTo(a.volume));
      case MarketSort.gainers:
        list.sort((a, b) => b.changePercent.compareTo(a.changePercent));
      case MarketSort.losers:
        list.sort((a, b) => a.changePercent.compareTo(b.changePercent));
      case MarketSort.name:
        list.sort((a, b) => a.base.compareTo(b.base));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    final theme = Theme.of(context);
    return ListenableBuilder(
      listenable: app.market,
      builder: (context, _) {
        final market = app.market;
        final favorites = market.favorites.toSet();
        final items = _visible(market.tickers.values, favorites);
        return ContentWidth(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Markets',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: 'Refresh prices',
                      onPressed: market.loading ? null : market.refresh,
                      icon: const Icon(Icons.refresh_rounded),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onChanged: (v) => setState(() => _query = v),
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                    hintText: 'Search coins (BTC, ETH…)',
                    prefixIcon: Icon(Icons.search_rounded),
                  ),
                ),
              ),
              SizedBox(
                height: 52,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    FilterChip(
                      label: const Text('Favorites'),
                      avatar: const Icon(Icons.star_rounded, size: 18),
                      selected: _favoritesOnly,
                      onSelected: (v) => setState(() => _favoritesOnly = v),
                    ),
                    for (final s in MarketSort.values)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: ChoiceChip(
                          label: Text(s.label),
                          selected: _sort == s,
                          onSelected: (_) => setState(() => _sort = s),
                        ),
                      ),
                  ],
                ),
              ),
              if (market.error != null)
                ErrorBanner(message: market.error!, onRetry: market.refresh),
              Expanded(
                child: !market.hasData && market.error == null
                    ? const Center(child: CircularProgressIndicator())
                    : items.isEmpty
                        ? Center(
                            child: Text(
                              market.hasData
                                  ? 'No coins match your filters'
                                  : 'No data yet',
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: market.refresh,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(bottom: 120),
                              itemCount: items.length,
                              itemBuilder: (context, i) {
                                final t = items[i];
                                return _MarketRow(
                                  ticker: t,
                                  favorite: favorites.contains(t.base),
                                  onFavorite: () => market.toggleFavorite(t.base),
                                  onTap: () => widget.onOpenCoin(t.base),
                                );
                              },
                            ),
                          ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MarketRow extends StatelessWidget {
  const _MarketRow({
    required this.ticker,
    required this.favorite,
    required this.onFavorite,
    required this.onTap,
  });

  final Ticker ticker;
  final bool favorite;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.only(left: 20, right: 4),
      leading: CoinIcon(ticker.base, size: 40),
      title: Text(
        ticker.base,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      subtitle: Text('Vol ${formatCompact(ticker.volume)} USDT'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatPrice(ticker.last),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              ChangeChip(ticker.changePercent),
            ],
          ),
          IconButton(
            tooltip: favorite
                ? 'Remove ${ticker.base} from favorites'
                : 'Add ${ticker.base} to favorites',
            onPressed: onFavorite,
            icon: Icon(
              favorite ? Icons.star_rounded : Icons.star_border_rounded,
              color: favorite ? Colors.amber : null,
            ),
          ),
        ],
      ),
    );
  }
}
