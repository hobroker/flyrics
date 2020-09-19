import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/stores/theme.dart';

@immutable
class UX {
  final ThemeStore _theme;

  UX({
    @required ThemeStore theme,
  }) : _theme = theme;

  final Duration transitionDuration = const Duration(milliseconds: 300);

  final double spacingUnit = 4;
  final double footerHeight = 20;
  final double headerMinHeight = 48;
  final double headerMaxHeight = 80;
  final double infoIconSize = 48;

  ThemeData get theme => _theme.theme;

  Color get primaryColor => theme.primaryColor;

  Color get textColor => theme.primaryColorLight;
}
