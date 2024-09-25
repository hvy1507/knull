import 'package:flutter/material.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/ui/widget/image_view.dart';
import 'package:skeleton/utils/extension/build_context.dart';
import 'package:skeleton/utils/extension/list.ext.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ImageView.asset(
            R.vectors.logo,
            color: Colors.red,
            width: 64,
            height: 64,
          ),
          Text(
            'KNULL',
            style: context.textTheme.displaySmall,
          )
        ].addBetween(const SizedBox(width: 16)),
      );
}
