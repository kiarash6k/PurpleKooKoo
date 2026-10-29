import 'package:flutter_test/flutter_test.dart';
import 'package:purple_kookoo/core/format.dart';

void main() {
  group('formatPrice', () {
    test('groups thousands and keeps two decimals', () {
      expect(formatPrice(78859.6), '78,859.60');
      expect(formatPrice(1234567), '1,234,567.00');
    });
    test('uses more decimals for small prices and trims zeros', () {
      expect(formatPrice(1.2), '1.20');
      expect(formatPrice(1.23456), '1.2346');
      expect(formatPrice(0.00001234), '0.00001234');
    });
    test('handles negatives', () => expect(formatPrice(-1500.5), '-1,500.50'));
  });

  test('formatPercent adds an explicit sign', () {
    expect(formatPercent(2.5), '+2.50%');
    expect(formatPercent(-0.031), '-0.03%');
    expect(formatPercent(0), '0.00%');
  });

  test('formatCompact', () {
    expect(formatCompact(334122259), '334.1M');
    expect(formatCompact(12500), '12.5K');
    expect(formatCompact(7), '7');
  });

  test('timeAgo', () {
    final now = DateTime(2026, 1, 1, 12);
    expect(timeAgo(now.subtract(const Duration(seconds: 3)), now: now), 'just now');
    expect(timeAgo(now.subtract(const Duration(minutes: 5)), now: now), '5 min ago');
    expect(timeAgo(now.subtract(const Duration(hours: 2)), now: now), '2 h ago');
  });
}
