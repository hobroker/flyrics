import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<ui.Image> bytesToImage(List<int> img) async {
  var completer = Completer<ui.Image>();
  ui.decodeImageFromList(img, (ui.Image img) {
    return completer.complete(img);
  });
  return completer.future;
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
