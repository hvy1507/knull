import 'package:flutter/material.dart';

abstract class BaseTheme {
  ThemeData get theme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: colorScheme.primary,
    colorScheme: colorScheme,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
    textSelectionTheme: textSelectorThemeData,
    filledButtonTheme: filledButtonTheme,
  );

  FilledButtonThemeData get filledButtonTheme;

  InputDecorationTheme get inputDecorationTheme;

  TextSelectionThemeData get textSelectorThemeData;

  TextTheme get textTheme;

  ColorScheme get colorScheme;

  ThemeData getTheme(){
    return theme;
  }
}
