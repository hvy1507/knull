import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeleton/ui/view/splash/splash.cubit.dart';
import 'package:skeleton/ui/view/splash/splash.view.dart';


class AppRoute {
  AppRoute._();

  static const String splash = '/';

  static GoRouter configurations = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SplashCubit(),
            child: const SplashView(),
          );
        },
      ),
    ],
  );
}