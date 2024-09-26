import 'package:flutter/material.dart';
import 'package:skeleton/base/app_theme.base.dart';
import 'package:skeleton/ui/theme/factory.theme.dart';

class Dark extends BaseTheme {
  @override
  ColorScheme get colorScheme => ColorScheme.fromSeed(
        seedColor: const Color(0xFFf7bb0d),
        brightness: Brightness.dark,
      ).copyWith(
        //Background
        primary: const Color(0xFF1d1c22),
        onPrimary: Colors.white,
        //Widget
        secondary: const Color(0xFF262626),
        //Button
        tertiary: const Color(0xFFf7bb0d),
        onTertiary: const Color(0xFFffe6b9),

      );

  @override
  FilledButtonThemeData get filledButtonTheme =>
      Factory.instance.getGlobal(Global.filled, colorScheme);

  @override
  InputDecorationTheme get inputDecorationTheme =>
      Factory.instance.getGlobal(Global.input, colorScheme);

  @override
  TextSelectionThemeData get textSelectorThemeData =>
      const TextSelectionThemeData(cursorColor: Colors.white);

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
