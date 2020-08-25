import 'package:flutter/material.dart';

class UI {
  final BuildContext context;
  double appHeight;
  double appWidth;
  double headerHeight = 50;
  double headerWidth;

  static const Color primaryColor = Color(0xff282828);
  static const Color primaryDarkColor = Color(0xff121212);
  static const Color darkColor = Color(0xff191414);
  static const Color accentColor = Color(0xff62D36E);
  static const Color textColor = Color(0xffffffff);

  UI(this.context) {
    var size = MediaQuery.of(this.context).size;
    this.appHeight = size.height;
    this.appWidth = size.width;
    this.headerWidth = this.appWidth;
  }
}
