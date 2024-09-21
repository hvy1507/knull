import 'package:flutter/material.dart';

typedef ThemeBundle<T> = ({T? light, T? dark});

abstract class BaseAppTheme {
  ThemeData get lightThemeData {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorSchemes().light,
    );
  }

  ThemeData get darkThemeData {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorSchemes().dark,
    );
  }

  ThemeBundle<ColorScheme> colorSchemes();
}