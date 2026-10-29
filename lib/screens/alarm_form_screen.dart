import 'dart:async';

import 'package:flutter/material.dart';

import '../app_services.dart';
import '../core/format.dart';
import '../core/theme.dart';
import '../data/alarm.dart';
import '../widgets/common.dart';

/// Create a price alarm. [initialSymbol] pre-selects a coin.
class AlarmFormScreen extends StatefulWidget {
  const AlarmFormScreen({super.key, this.initialSymbol});

  final String? initialSymbol;

  @override
  State<AlarmFormScreen> createState() => _AlarmFormScreenState();
}

class _AlarmFormScreenState extends State<AlarmFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _target = TextEditingController();
  late String _symbol = widget.initialSymbol ?? 'BTC';
  AlarmDirection _direction = AlarmDirection.above;

  @override
  void dispose() {
    _target.dispose();
    super.dispose();
  }

  Future<void> _pickCoin() async {
    final app = AppScope.of(context);
    final picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _CoinPicker(
        symbols: (app.market.tickers.keys.toList()..sort()),
        favorites: app.market.favorites,
      ),
    );
    if (picked != null) setState(() => _symbol = picked);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final app = AppScope.of(context);
    final target = double.parse(_target.text.replaceAll(',', '.'));
    await app.alarms.add(
      symbol: _symbol,
      target: target,
      direction: _direction,
    );
    if (mounted) Navigator.of(context).pop(true);
    // Ask after closing the form so the OS prompt never blocks the UI.
    if (app.settings.notificationsEnabled) {
      unawaited(app.notifier.requestPermission());
    }
  }

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    final theme = Theme.of(context);
    return AppBackground(
      child: Scaffold(
        appBar: AppBar(title: const Text('New alarm')),
        body: SafeArea(
          child: ContentWidth(
            child: ListenableBuilder(
              listenable: app.market,
              builder: (context, _) {
                final price = app.market.tickerFor(_symbol)?.last;
                return Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      GlassCard(
                        onTap: _pickCoin,
                        child: Row(
                          children: [
                            CoinIcon(_symbol, size: 44),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$_symbol / USDT',
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    price == null
                                        ? 'Price unavailable'
                                        : 'Current price ${formatPrice(price)}',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.expand_more_rounded),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text('Notify me when the price', style: theme.textTheme.labelLarge),
                      const SizedBox(height: 8),
                      SegmentedButton<AlarmDirection>(
                        showSelectedIcon: false,
                        segments: [
                          for (final d in AlarmDirection.values)
                            ButtonSegment(value: d, label: Text(d.label)),
                        ],
                        selected: {_direction},
                        onSelectionChanged: (s) =>
                            setState(() => _direction = s.first),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _target,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelText: 'Target price (USDT)',
                          suffix: price == null
                              ? null
                              : TextButton(
                                  onPressed: () => _target.text =
                                      price.toStringAsFixed(price >= 1 ? 2 : 6),
                                  child: const Text('Use current'),
                                ),
                        ),
                        validator: (value) {
                          final v = double.tryParse(
                            (value ?? '').trim().replaceAll(',', '.'),
                          );
                          if (v == null || v <= 0) {
                            return 'Enter a price greater than 0';
                          }
                          if (price != null &&
                              (_direction == AlarmDirection.above
                                  ? v <= price
                                  : v >= price)) {
                            return _direction == AlarmDirection.above
                                ? 'Target must be above the current price'
                                : 'Target must be below the current price';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      FilledButton.icon(
                        onPressed: _save,
                        icon: const Icon(Icons.add_alert_rounded),
                        label: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Text('Add alarm'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CoinPicker extends StatefulWidget {
  const _CoinPicker({required this.symbols, required this.favorites});

  final List<String> symbols;
  final List<String> favorites;

  @override
  State<_CoinPicker> createState() => _CoinPickerState();
}

class _CoinPickerState extends State<_CoinPicker> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final q = _query.trim().toUpperCase();
    final symbols = [
      ...widget.favorites.where(widget.symbols.contains),
      ...widget.symbols.where((s) => !widget.favorites.contains(s)),
    ].where((s) => q.isEmpty || s.contains(q)).toList();
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: TextField(
                autofocus: true,
                onChanged: (v) => setState(() => _query = v),
                decoration: const InputDecoration(
                  hintText: 'Search coins',
                  prefixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
            Expanded(
              child: symbols.isEmpty
                  ? const Center(child: Text('No coins found'))
                  : ListView.builder(
                      itemCount: symbols.length,
                      itemBuilder: (_, i) => ListTile(
                        leading: CoinIcon(symbols[i], size: 36),
                        title: Text(symbols[i]),
                        subtitle: Text('${symbols[i]}/USDT'),
                        onTap: () => Navigator.of(context).pop(symbols[i]),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
