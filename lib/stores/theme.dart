import 'package:flutter/material.dart';
import 'package:flyrics/modules/color_extension.dart';
import 'package:mobx/mobx.dart';

part 'theme.g.dart';

class ThemeStore = ThemeStoreBase with _$ThemeStore;

abstract class ThemeStoreBase with Store {
  @observable
  ThemeData theme = ThemeData(
    primaryColor: Color(0xff282828),
    primaryColorDark: Color(0xff121212),
  );

  @action
  void setColors(List<Color> colors) {
    final primaryColor = colors.first.autoDarkened;

    theme = theme.copyWith(
      primaryColor: primaryColor,
      primaryColorLight: primaryColor.opposite,
      primaryColorDark: colors[1],
    );
  }

  @computed
  Color get primaryColor => theme.primaryColor;

  @computed
  Color get textColor => theme.primaryColorLight;
}
