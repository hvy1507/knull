import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  String format(String format, [Locale? locale]) {
    return DateFormat(format, locale?.toString()).format(this);
  }
}
