import 'package:flutter/material.dart';

double relativeSize(double main, double percent, {double max}) {
  var result = main * percent;
  if (max == null) {
    return result;
  }

  if (result > max) {
    result = max;
  }

  return result;
}

class UI {
  final BuildContext context;
  double appHeight;
  double appWidth;
  double headerWidth;

  static const Color primaryColor = Color(0xff282828);
  static const Color primaryDarkColor = Color(0xff121212);
  static const Color darkColor = Color(0xff191414);
  static const Color accentColor = Color(0xff62D36E);
  static const Color textColor = Color(0xffffffff);

  static Duration transitionDuration = Duration(milliseconds: 1500);

  UI(this.context) {
    var size = MediaQuery.of(context).size;
    appHeight = size.height;
    appWidth = size.width;
    headerWidth = appWidth;
  }

  double get headerHeight => relativeSize(appWidth, .2, max: 80);

  double get trackNameFontSize => relativeSize(headerHeight, .25, max: 20);

  double get trackArtistFontSize => relativeSize(headerHeight, .2, max: 18);

  double get lyricsFontSize => relativeSize(headerHeight, .185, max: 14);
}
