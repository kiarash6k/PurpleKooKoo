enum AlarmDirection {
  above('Rises above'),
  below('Drops below');

  const AlarmDirection(this.label);
  final String label;
}

/// A price alarm: fires once when [symbol] crosses [target] in [direction].
class Alarm {
  const Alarm({
    required this.id,
    required this.symbol,
    required this.target,
    required this.direction,
    required this.createdAt,
    this.triggeredAt,
  });

  final String id;
  final String symbol;
  final double target;
  final AlarmDirection direction;
  final DateTime createdAt;

  /// Set once the alarm has fired; it stays in the list until re-armed.
  final DateTime? triggeredAt;

  bool get isActive => triggeredAt == null;

  bool isTriggeredBy(double price) => direction == AlarmDirection.above
      ? price >= target
      : price <= target;

  Alarm copyWith({DateTime? triggeredAt, bool clearTriggered = false}) => Alarm(
        id: id,
        symbol: symbol,
        target: target,
        direction: direction,
        createdAt: createdAt,
        triggeredAt: clearTriggered ? null : triggeredAt ?? this.triggeredAt,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'target': target,
        'direction': direction.name,
        'createdAt': createdAt.toIso8601String(),
        'triggeredAt': triggeredAt?.toIso8601String(),
      };

  static Alarm? fromJson(Object? json) {
    if (json is! Map) return null;
    try {
      return Alarm(
        id: json['id'] as String,
        symbol: json['symbol'] as String,
        target: (json['target'] as num).toDouble(),
        direction: AlarmDirection.values.byName(json['direction'] as String),
        createdAt: DateTime.parse(json['createdAt'] as String),
        triggeredAt: json['triggeredAt'] == null
            ? null
            : DateTime.parse(json['triggeredAt'] as String),
      );
    } catch (_) {
      return null;
    }
  }
}
