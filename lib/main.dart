import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:skeleton/di/app_dependencies.dart';
import 'package:skeleton/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  AppDependency().initiate();
  runApp(const MainApp());
}
