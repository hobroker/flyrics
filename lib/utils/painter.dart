import 'dart:ui';

import 'package:flutter/material.dart';

TextPainter paintText(String text, TextStyle style, BoxConstraints constraints,
    {int maxLines}) {
  final span = TextSpan(
    text: text,
    style: style,
  );
  final textPainter = TextPainter(
    text: span,
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
  );
  textPainter.layout(maxWidth: constraints.maxWidth);

  return textPainter;
}
