import 'package:flutter/material.dart';

extension _BrightnessExtension on Brightness {
  Brightness get opposite {
    if (this == Brightness.dark) {
      return Brightness.light;
    }
    return Brightness.dark;
  }
}