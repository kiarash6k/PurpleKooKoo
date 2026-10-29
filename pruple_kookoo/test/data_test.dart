import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:purple_kookoo/data/alarm.dart';
import 'package:purple_kookoo/data/market_repository.dart';
import 'package:purple_kookoo/data/ticker.dart';

void main() {
  group('Ticker.fromKucoin', () {
    test('parses a USDT pair and converts change to percent', () {
      final t = Ticker.fromKucoin({
        'symbol': 'BTC-USDT',
        'last': '78859.6',
        'changeRate': '-0.0296',
        'volValue': '334122259.35',
      })!;
      expect(t.base, 'BTC');
      expect(t.last, 78859.6);
      expect(t.changePercent, closeTo(-2.96, 1e-9));
      expect(t.pair, 'BTC/USDT');
    });

    test('skips non-USDT pairs and unusable prices', () {
      expect(Ticker.fromKucoin({'symbol': 'ETH-BTC', 'last': '0.05'}), isNull);
      expect(Ticker.fromKucoin({'symbol': 'X-USDT', 'last': null}), isNull);
      expect(Ticker.fromKucoin({'symbol': 'X-USDT', 'last': '0'}), isNull);
    });
  });

  group('MarketRepository', () {
    MarketRepository repo(http.Response Function() respond) =>
        MarketRepository(client: MockClient((_) async => respond()));

    test('returns USDT tickers keyed by symbol', () async {
      final body = json.encode({
        'data': {
          'ticker': [
            {'symbol': 'BTC-USDT', 'last': '100', 'changeRate': '0.01', 'volValue': '1'},
            {'symbol': 'ETH-BTC', 'last': '0.05'},
          ],
        },
      });
      final result = await repo(() => http.Response(body, 200)).fetchTickers();
      expect(result.keys, ['BTC']);
    });

    test('maps HTTP errors, bad payloads and network failures', () async {
      await expectLater(
        repo(() => http.Response('', 500)).fetchTickers(),
        throwsA(isA<MarketException>()),
      );
      await expectLater(
        repo(() => http.Response('not json', 200)).fetchTickers(),
        throwsA(isA<MarketException>()),
      );
      final failing = MarketRepository(
        client: MockClient((_) async => throw http.ClientException('boom')),
      );
      await expectLater(failing.fetchTickers(), throwsA(isA<MarketException>()));
    });
  });

  group('Alarm', () {
    final alarm = Alarm(
      id: '1',
      symbol: 'BTC',
      target: 100,
      direction: AlarmDirection.above,
      createdAt: DateTime(2026),
    );

    test('triggers on the right side of the target', () {
      expect(alarm.isTriggeredBy(99.9), isFalse);
      expect(alarm.isTriggeredBy(100), isTrue);
      final below = Alarm(
        id: '2',
        symbol: 'BTC',
        target: 100,
        direction: AlarmDirection.below,
        createdAt: DateTime(2026),
      );
      expect(below.isTriggeredBy(100.1), isFalse);
      expect(below.isTriggeredBy(100), isTrue);
    });

    test('round-trips through JSON and rejects bad data', () {
      final fired = alarm.copyWith(triggeredAt: DateTime(2026, 2));
      final back = Alarm.fromJson(json.decode(json.encode(fired.toJson())))!;
      expect(back.symbol, 'BTC');
      expect(back.triggeredAt, DateTime(2026, 2));
      expect(back.isActive, isFalse);
      expect(Alarm.fromJson({'id': 1}), isNull);
      expect(Alarm.fromJson('nope'), isNull);
    });
  });
}
