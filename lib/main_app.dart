import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/services/shared_preference.dart';
import 'package:skeleton/ui/route/routes.dart';
import 'package:skeleton/ui/theme/material_theme.dart';
import 'package:skeleton/ui/theme/theme.cubit.dart';
import 'package:skeleton/ui/theme/theme.state.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (BuildContext context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Skeleton',
            routerConfig: AppRoute.configurations,
            theme: Application().sharedPreferences.get('darkMode') == true ? darkTheme: lightTheme,
          );
        },
      ),
    );
  }
}