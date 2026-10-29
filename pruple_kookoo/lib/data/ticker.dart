/// A 24 h market snapshot for one USDT pair.
class Ticker {
  const Ticker({
    required this.base,
    required this.last,
    required this.changePercent,
    required this.volume,
  });

  /// Base asset symbol, e.g. `BTC` for the `BTC-USDT` pair.
  final String base;
  final double last;

  /// 24 h change in percent (`-2.96` means -2.96 %).
  final double changePercent;

  /// 24 h traded volume in USDT.
  final double volume;

  String get pair => '$base/USDT';

  /// Parses one entry of KuCoin's `allTickers` response. Returns null for
  /// non-USDT pairs and entries without a usable price.
  static Ticker? fromKucoin(Map<String, dynamic> json) {
    final symbol = json['symbol'];
    if (symbol is! String || !symbol.endsWith('-USDT')) return null;
    final last = double.tryParse('${json['last']}');
    if (last == null || last <= 0) return null;
    return Ticker(
      base: symbol.substring(0, symbol.length - '-USDT'.length),
      last: last,
      changePercent: (double.tryParse('${json['changeRate']}') ?? 0) * 100,
      volume: double.tryParse('${json['volValue']}') ?? 0,
    );
  }
}
