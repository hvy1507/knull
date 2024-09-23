import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeleton/ui/view/login/login.view.dart';
import 'package:skeleton/ui/view/splash/splash.cubit.dart';
import 'package:skeleton/ui/view/splash/splash.view.dart';

class AppRoute {
  AppRoute._();

  static const String splash = '/';
  static const String login = '/login';

  static GoRouter configurations = GoRouter(
    initialLocation: login,
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
      GoRoute(
        path: login,
        builder: (context, state) {
          return const LoginView();
        },
      ),
    ],
  );
}
