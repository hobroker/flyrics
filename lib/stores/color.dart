import 'dart:ui';

import 'package:flyrics/modules/mobx/async_data.dart';
import 'package:flyrics/utils/image.dart';

class ColorStore extends AsyncDataStore<List<Color>> {
  ColorStore()
      : super(
          isEmpty: (data) => data.isEmpty,
        );

  Future fetch(List<int> bytes) => wait(findImageColors(bytes));
}
