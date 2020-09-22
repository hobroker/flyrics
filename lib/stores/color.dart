import 'dart:async';
import 'dart:ui';

import 'package:flyrics/modules/mobx/async_data.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorStore extends AsyncDataStore<List<Color>> {
  ColorStore()
      : super(
          isEmpty: (data) => data.isEmpty,
        );

  Future fetch(List<int> bytes) => wait(_findImageColors(bytes));

  Future<List<Color>> _findImageColors(List<int> bytes) async {
    final image = await _bytesToImage(bytes);
    final generator = await PaletteGenerator.fromImage(
      image,
      maximumColorCount: 10,
    );

    return generator.colors.toList();
  }

  Future<Image> _bytesToImage(List<int> img) async {
    var completer = Completer<Image>();
    decodeImageFromList(img, (Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }
}
