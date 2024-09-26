import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:skeleton/ui/theme/global.theme.dart';

class Factory with Diagnosticable {
  Factory._();

  static final instance = Factory._();

  factory Factory() => instance;

  getGlobal(Global global, ColorScheme colorScheme) {
    switch (global) {
      case Global.input:
        return globalInputDecorationTheme(colorScheme);
      case Global.filled:
        return globalFilledButtonThemeData(colorScheme);
      case Global.text:
        return globalTextTheme(colorScheme);
    }
  }
}

enum Global { input, filled, text }
