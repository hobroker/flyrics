import 'package:flutter/material.dart';

class Conditional {
  static Widget single({
    @required bool when,
    @required Widget Function() render,
    @required Widget Function() fallback,
  }) =>
      when ? render() : fallback();
}
