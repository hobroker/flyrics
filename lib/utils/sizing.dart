import 'package:flutter/material.dart';

class UI {
  final BuildContext context;
  double appHeight;
  double appWidth;
  double headerWidth;
  double footerHeight = 20;

  static const Color primaryColor = Color(0xff282828);
  static const Color primaryDarkColor = Color(0xff121212);
  static const Color darkColor = Color(0xff191414);
  static const Color accentColor = Color(0xff62D36E);
  static const Color textColor = Color(0xffffffff);
  static const Color geniusAccentColor = Color(0xffFFFE7D);

  static String geniusIcon = 'assets/icons/genius.svg';

  static Duration transitionDuration = Duration(milliseconds: 300);

  UI(this.context) {
    var size = MediaQuery.of(context).size;
    appHeight = size.height;
    appWidth = size.width;
    headerWidth = appWidth;
  }
}

double relativeSize(double main, double percent, {double max, double min}) {
  var result = main * percent;
  if (min != null && result < min) {
    return min;
  }
  if (max != null && result > max) {
    return max;
  }

  return result;
}
