import 'package:flutter/material.dart';
import 'package:skeleton/ui/route/routes.dart';
import 'package:skeleton/ui/theme/theme.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Skeleton',
      routerConfig: AppRoute.configurations,
      theme: AppTheme().lightThemeData,
      darkTheme: AppTheme().darkThemeData,
    );
  }
}