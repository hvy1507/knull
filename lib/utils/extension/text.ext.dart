import 'package:flutter/material.dart';

extension RequiredTextExtension on Text {
  Text required({
    bool required = true,
    bool leading = false,
    Color color = Colors.red,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          if (leading && required)
            TextSpan(
              text: '* ',
              style: TextStyle(
                color: color,
              ),
            ),
          TextSpan(
            text: data,
          ),
          if (!leading && required)
            TextSpan(
              text: ' *',
              style: TextStyle(
                color: color,
              ),
            ),
        ],
      ),
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}