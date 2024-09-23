import 'package:flutter/material.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/ui/widget/image_view.dart';
import 'package:skeleton/utils/extension/list.ext.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(R.colors.primary),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageView.asset(
              R.vectors.logo,
              color: Colors.red,
              width: 256,
              height: 256,
            ),
            const Text(
              'KNULL',
              style: TextStyle(fontSize: 50, color: Colors.grey),
            )
          ].addBetween(
            const SizedBox(
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}
