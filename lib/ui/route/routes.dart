import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeleton/ui/view/account/account.view.dart';
import 'package:skeleton/ui/view/add/add.view.dart';
import 'package:skeleton/ui/view/dictionary/dictionary.view.dart';
import 'package:skeleton/ui/view/gemini/gemini.cubit.dart';
import 'package:skeleton/ui/view/gemini/gemini.view.dart';
import 'package:skeleton/ui/view/home/home.view.dart';
import 'package:skeleton/ui/view/login/login.cubit.dart';
import 'package:skeleton/ui/view/login/login.view.dart';
import 'package:skeleton/ui/view/navigation/main_navigation.view.dart';
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
  static const String dictionary = '/dictionary';
  static const String account = '/account';
  static const String add = '/add';
  static const String gemini = '/gemini';

  static const _rootNavKey = GlobalObjectKey<NavigatorState>('root');
  static const _mainNavKey = GlobalObjectKey<NavigatorState>('main');
  static GoRouter configurations = GoRouter(
    initialLocation: splash,
    navigatorKey: _rootNavKey,
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
      ShellRoute(
        parentNavigatorKey: _rootNavKey,
        navigatorKey: _mainNavKey,
        builder: (context, state, child) {
          return MainNavigationView(
            child: child,
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: _mainNavKey,
            path: home,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const HomeView(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.bounceInOut)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: _mainNavKey,
            path: dictionary,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const DictionaryView(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.bounceInOut)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: _mainNavKey,
            path: add,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const AddView(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.bounceInOut)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: _mainNavKey,
            path: gemini,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: BlocProvider(create: (context) {
                  return GeminiCubit();
                }, child: const GeminiView()),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.bounceInOut)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: _mainNavKey,
            path: account,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const AccountView(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.bounceInOut)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavKey,
        path: login,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginView(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavKey,
        path: register,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterView(),
          );
        },
      ),
    ],
  );
}
