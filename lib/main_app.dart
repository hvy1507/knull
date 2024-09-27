import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/constant/theme.ext.dart';
import 'package:skeleton/ui/route/routes.dart';
import 'package:skeleton/ui/theme/dark.theme.dart';
import 'package:skeleton/ui/theme/light.theme.dart';
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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: state.themeMode == Mode.light
                ? Light().getTheme()
                : Dark().getTheme(),
          );
        },
      ),
    );
  }
}
