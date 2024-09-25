import 'package:flutter/material.dart';

extension ColorSchemeExtension on ColorScheme {
  Color get toolbar => Colors.white;

  Color get onToolbar => Colors.yellow;

  Color get divider => const Color(0x0ff00000);

  Color get disabled => Colors.grey;
}
