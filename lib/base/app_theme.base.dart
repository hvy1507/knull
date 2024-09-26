import 'package:flutter/material.dart';

abstract class BaseTheme {
  ThemeData get theme;

  FilledButtonThemeData get filledButtonTheme;

  InputDecorationTheme get inputDecorationTheme;

  TextSelectionThemeData get textSelectorThemeData;

  TextTheme get textTheme;

  ColorScheme get colorScheme;

  ThemeData getTheme(){
    return theme;
  }
}
