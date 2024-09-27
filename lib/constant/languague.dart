import 'package:flutter/material.dart';

enum AppLang {
  english('en'),
  vietnamese('vi');

  const AppLang(this.code);

  static AppLang fromLocale(Locale locale) {
    return switch (locale.languageCode) {
      'vi' => AppLang.vietnamese,
      'en' => AppLang.english,
      String() => AppLang.english,
    };
  }

  final String code;

  Locale get locale {
    return switch (code) {
      'en' => const Locale('en', 'US'),
      'vi' => const Locale('vi', 'VN'),
      String() => const Locale('en', 'US'),
    };
  }
}