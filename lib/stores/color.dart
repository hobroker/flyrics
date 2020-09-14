import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flyrics/modules/color_extension.dart';
import 'package:flyrics/services/ux.dart';
import 'package:flyrics/utils/image.dart';
import 'package:mobx/mobx.dart';

part 'color.g.dart';

class ColorStore = ColorStoreBase with _$ColorStore;

abstract class ColorStoreBase with Store {
  @observable
  Object error;

  @observable
  List<Color> colors;
  final UX ux;

  ColorStoreBase({this.ux}) {
    resetColors();
  }

  @action
  Future fetchColors(List<int> bytes) async {
    if (bytes.isEmpty) {
      return;
    }

    try {
      colors = await findImageColors(bytes);
    } catch (err) {
      resetColors();
    }
  }

  @action
  void resetColors() {
    colors = [ux.primaryColor, ux.primaryColorDark];
  }

  @computed
  Color get dominantColor => colors.first.autoDarkened;

  @computed
  Color get textColor => dominantColor.opposite;

  @computed
  Color get placeholderBgColor => colors[1];

  @computed
  Color get placeholderFgColor => colors.first;
}
