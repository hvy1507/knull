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
        onTertiary: Color(0xFFefc8ff),
        error: Colors.red,
        seedColor: Colors.white,
      );

  @override
  FilledButtonThemeData get filledButtonTheme =>
      Factory.instance.getGlobal(Global.filled, colorScheme);

  @override
  InputDecorationTheme get inputDecorationTheme =>
      Factory.instance.getGlobal(Global.input, colorScheme);

  @override
  TextSelectionThemeData get textSelectorThemeData =>
      TextSelectionThemeData(cursorColor: colorScheme.tertiary);

  @override
  TextTheme get textTheme =>
      Factory.instance.getGlobal(Global.text, colorScheme);

  @override
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: colorScheme.primary,
        colorScheme: colorScheme,
        textTheme: textTheme,
        inputDecorationTheme: inputDecorationTheme,
        textSelectionTheme: textSelectorThemeData,
        filledButtonTheme: filledButtonTheme,
      );
}
