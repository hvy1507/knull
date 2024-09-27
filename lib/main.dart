import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:skeleton/di/app_dependencies.dart';
import 'package:skeleton/main_app.dart';
import 'package:skeleton/services/shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  AppDependency().initiate();
  Application();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('vi', 'VN'),
      Locale('en', 'US'),
    ],
    fallbackLocale: const Locale('en', 'US'),
    path: 'assets/translations',
    child: const MainApp(),
  ),);
}
