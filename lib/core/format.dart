/// Formats a price with an adaptive number of decimals and thousands
/// separators: `78,859.60`, `1.2345`, `0.00001234`.
String formatPrice(double value) {
  final abs = value.abs();
  final decimals = abs >= 1000
      ? 2
      : abs >= 1
          ? 4
          : abs >= 0.01
              ? 5
              : 8;
  final fixed = value.toStringAsFixed(decimals);
  final parts = fixed.split('.');
  final sign = parts[0].startsWith('-') ? '-' : '';
  final digits = parts[0].replaceFirst('-', '');
  final grouped = digits.replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (_) => ',',
  );
  var fraction = parts.length > 1 ? parts[1] : '';
  // Keep at least two decimals, drop further trailing zeros.
  while (fraction.length > 2 && fraction.endsWith('0')) {
    fraction = fraction.substring(0, fraction.length - 1);
  }
  return fraction.isEmpty ? '$sign$grouped' : '$sign$grouped.$fraction';
}

/// Formats a percentage already expressed in percent, with an explicit sign.
String formatPercent(double percent) {
  final sign = percent > 0 ? '+' : '';
  return '$sign${percent.toStringAsFixed(2)}%';
}

/// Compact volume such as `334.1M` or `12.5K`.
String formatCompact(double value) {
  final abs = value.abs();
  if (abs >= 1e9) return '${(value / 1e9).toStringAsFixed(1)}B';
  if (abs >= 1e6) return '${(value / 1e6).toStringAsFixed(1)}M';
  if (abs >= 1e3) return '${(value / 1e3).toStringAsFixed(1)}K';
  return value.toStringAsFixed(0);
}

/// "just now", "5 min ago", "2 h ago" for status lines.
String timeAgo(DateTime time, {DateTime? now}) {
  final diff = (now ?? DateTime.now()).difference(time);
  if (diff.inSeconds < 10) return 'just now';
  if (diff.inMinutes < 1) return '${diff.inSeconds}s ago';
  if (diff.inHours < 1) return '${diff.inMinutes} min ago';
  if (diff.inDays < 1) return '${diff.inHours} h ago';
  return '${diff.inDays} d ago';
}
