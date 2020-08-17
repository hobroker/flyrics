import 'package:flutter/material.dart';

class Sizing {
  final BuildContext context;
  double appHeight;
  double appWidth;

  double headerHeight = 50;
  double headerWidth;

  Sizing(this.context) {
    this.appHeight = MediaQuery.of(this.context).size.height;
    this.appWidth = MediaQuery.of(this.context).size.width;
    this.headerWidth = this.appWidth;
  }
}
