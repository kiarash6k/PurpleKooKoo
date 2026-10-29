import 'package:purple_kookoo/data/alarm.dart';
import 'package:purple_kookoo/data/market_repository.dart';
import 'package:purple_kookoo/data/ticker.dart';
import 'package:purple_kookoo/services/notification_service.dart';

class FakeRepository extends MarketRepository {
  FakeRepository(this.tickers);

  Map<String, Ticker> tickers;
  bool fail = false;

  @override
  Future<Map<String, Ticker>> fetchTickers() async {
    if (fail) throw const MarketException('offline');
    return tickers;
  }
}

class FakeNotifier implements AlarmNotifier {
  final shown = <(Alarm, double)>[];
  int permissionRequests = 0;

  @override
  Future<void> init() async {}

  @override
  Future<bool> requestPermission() async {
    permissionRequests++;
    return true;
  }

  @override
  Future<void> showTriggered(Alarm alarm, double price) async =>
      shown.add((alarm, price));
}

Ticker ticker(String base, double last, {double change = 1, double volume = 5e6}) =>
    Ticker(base: base, last: last, changePercent: change, volume: volume);
