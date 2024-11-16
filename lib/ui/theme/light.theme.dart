import 'package:flutter/material.dart';

import 'package:skeleton/base/app_theme.base.dart';
import 'package:skeleton/ui/theme/factory.theme.dart';

class Light extends BaseTheme {
  @override
  ColorScheme get colorScheme => ColorScheme.fromSeed(
        brightness: Brightness.light,
        primary: Colors.white,
        onPrimary: Colors.black,
        secondary: Colors.white,
        tertiary: const Color(0xFF47215c),
        onTertiary: const Color(0xFFefc8ff),
        error: Colors.red,
        seedColor: Colors.white,
      );

  @override
  FilledButtonThemeData get filledButtonTheme =>
      Factory().getGlobal(Global.filled, colorScheme);

  @override
  InputDecorationTheme get inputDecorationTheme =>
      Factory().getGlobal(Global.input, colorScheme);

  @override
  TextSelectionThemeData get textSelectorThemeData =>
      TextSelectionThemeData(cursorColor: colorScheme.tertiary);

  @override
  TextTheme get textTheme => Factory().getGlobal(Global.text, colorScheme);
}
