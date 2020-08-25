import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'load_image.dart';

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

Color findOppositeColor(Color color) {
  var luminance = color.computeLuminance();

  if (luminance < 0.5) {
    return lighten(color, 0.75);
  }

  var amount = luminance > 0.75 ? luminance : 0.5;

  return darken(color, amount);
}

Color autoDarken(Color color) {
  var luminance = color.computeLuminance();
  if (luminance > 0.35) {
    return darken(color, 0.2);
  }

  return color;
}

Future<List<Color>> findImageColors(List<int> bytes) async {
  var image = await bytesToImage(bytes);
  var generator = await PaletteGenerator.fromImage(
    image,
    maximumColorCount: 10,
  );

  var colors = generator.colors.toList();

  return colors;
}
