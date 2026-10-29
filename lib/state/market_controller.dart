import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/coins.dart';
import '../data/market_repository.dart';
import '../data/ticker.dart';

/// Holds live market data and the user's favorite coins.
class MarketController extends ChangeNotifier {
  MarketController(
    this._repository,
    this._prefs, {
    this.refreshInterval = const Duration(seconds: 30),
  }) : _favorites = (_prefs.getStringList(_favoritesKey) ?? defaultFavorites)
            .toList();

  static const _favoritesKey = 'favorites';

  final MarketRepository _repository;
  final SharedPreferences _prefs;
  final Duration refreshInterval;

  /// Called after every successful refresh.
  void Function(Map<String, Ticker> tickers)? onData;

  Map<String, Ticker> _tickers = const {};
  final List<String> _favorites;
  bool _loading = false;
  String? _error;
  DateTime? _lastUpdated;
  Timer? _timer;

  Map<String, Ticker> get tickers => _tickers;
  bool get loading => _loading;

  /// Message of the last failed refresh; cleared by the next success.
  String? get error => _error;
  DateTime? get lastUpdated => _lastUpdated;
  List<String> get favorites => List.unmodifiable(_favorites);

  bool get hasData => _tickers.isNotEmpty;

  Ticker? tickerFor(String symbol) => _tickers[symbol];

  bool isFavorite(String symbol) => _favorites.contains(symbol);

  Future<void> refresh() async {
    if (_loading) return;
    _loading = true;
    notifyListeners();
    try {
      _tickers = await _repository.fetchTickers();
      _lastUpdated = DateTime.now();
      _error = null;
      onData?.call(_tickers);
    } on MarketException catch (e) {
      _error = e.message;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void startAutoRefresh() {
    _timer?.cancel();
    refresh();
    _timer = Timer.periodic(refreshInterval, (_) => refresh());
  }

  void stopAutoRefresh() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> toggleFavorite(String symbol) async {
    if (!_favorites.remove(symbol)) _favorites.add(symbol);
    notifyListeners();
    await _prefs.setStringList(_favoritesKey, _favorites);
  }

  @override
  void dispose() {
    stopAutoRefresh();
    super.dispose();
  }
}
