import 'dart:math';

extension NumberExtension on num {
  String toStringSeparated([String separator = '.']) {
    return toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}$separator',
    );
  }

  bool inRange(num min, num max) {
    return this >= min && this <= max;
  }
}
