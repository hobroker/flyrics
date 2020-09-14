import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class UX {
  final ThemeData theme;

  UX({this.theme});

  Color get primaryColor => theme.primaryColor;

  Color get primaryColorDark => theme.primaryColorDark;

  final Duration transitionDuration = Duration(milliseconds: 300);

  final double spacingUnit = 4;
  final double footerHeight = 20;
  final double headerMinHeight = 50;
  final double headerMaxHeight = 75;
}
