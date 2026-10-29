import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ticker.dart';

class MarketException implements Exception {
  const MarketException(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Fetches live prices from the public KuCoin API.
class MarketRepository {
  MarketRepository({http.Client? client, Uri? endpoint})
      : _client = client ?? http.Client(),
        _endpoint = endpoint ??
            Uri.parse('https://api.kucoin.com/api/v1/market/allTickers');

  final http.Client _client;
  final Uri _endpoint;

  /// All USDT pairs keyed by base symbol. Throws [MarketException] with a
  /// user-presentable message on any failure.
  Future<Map<String, Ticker>> fetchTickers() async {
    final http.Response response;
    try {
      response =
          await _client.get(_endpoint).timeout(const Duration(seconds: 10));
    } catch (_) {
      throw const MarketException(
        "Couldn't reach the price service. Check your connection.",
      );
    }
    if (response.statusCode != 200) {
      throw MarketException(
        'Price service returned an error (${response.statusCode}).',
      );
    }
    try {
      final body = json.decode(response.body) as Map<String, dynamic>;
      final list = (body['data']['ticker'] as List).cast<Map<String, dynamic>>();
      final result = <String, Ticker>{};
      for (final entry in list) {
        final ticker = Ticker.fromKucoin(entry);
        if (ticker != null) result[ticker.base] = ticker;
      }
      if (result.isEmpty) throw const FormatException('empty');
      return result;
    } catch (_) {
      throw const MarketException('Received unexpected data from the service.');
    }
  }
}
