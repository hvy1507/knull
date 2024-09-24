import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeleton/ui/home/home.view.dart';
import 'package:skeleton/ui/view/login/login.cubit.dart';
import 'package:skeleton/ui/view/login/login.view.dart';
import 'package:skeleton/ui/view/register/register.cubit.dart';
import 'package:skeleton/ui/view/register/register.view.dart';
import 'package:skeleton/ui/view/splash/splash.cubit.dart';
import 'package:skeleton/ui/view/splash/splash.view.dart';

class AppRoute {
  AppRoute._();

  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';


  static GoRouter configurations = GoRouter(
    initialLocation: splash,
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
          return BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginView(),
          );
        },
      ),
      GoRoute(
        path: register,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterView(),
          );
        },
      ),
      GoRoute(
        path: home,
        builder: (context, state) {
          return const HomeView();
        },
      ),
    ],
  );
}
