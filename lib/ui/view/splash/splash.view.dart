import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/services/shared_preference.dart';
import 'package:skeleton/ui/route/routes.dart';
import 'package:skeleton/ui/widget/image_view.dart';
import 'package:skeleton/utils/extension/build_context.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isAnimated = true;
      });
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          if (Application().sharedPreferences.getBool('hasLoggedIn') ?? false) {
            context.go(AppRoute.login);
          } else {
            context.go(AppRoute.login);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final shortestSide = screenSize.shortestSide;

    final logoSize = shortestSide * 0.25;
    final fontSize = shortestSide * 0.1;

    final textWidth = fontSize * 5;
    final totalWidth = logoSize + (shortestSide * 0.05) + textWidth;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutQuad,
            top: _isAnimated
                ? (screenSize.height / 2) - (logoSize / 2)
                : -logoSize,
            left: (screenSize.width - totalWidth) / 2,
            child: ImageView.asset(
              R.vectors.logo,
              color: Colors.red,
              width: logoSize,
              height: logoSize,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutQuad,
            top: (screenSize.height / 2) - (fontSize / 2),
            left: _isAnimated
                ? (screenSize.width - totalWidth) / 2 +
                    logoSize +
                    (shortestSide * 0.05)
                : screenSize.width,
            child: Text(
              'KNULL',
              style: context.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
