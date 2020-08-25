import 'package:flutter/material.dart';

class Conditional {
  static Widget single({
    @required bool when,
    @required Widget Function() render,
    @required Widget Function() fallback,
  }) =>
      when ? render() : fallback();

  static List<Widget> many({
    @required bool when,
    @required List<Widget> Function() render,
    @required List<Widget> Function() fallback,
  }) =>
      when ? render() : fallback();
}
