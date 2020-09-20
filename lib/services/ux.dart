import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/stores/theme.dart';

@immutable
class UX {
  final ThemeStore _theme;
  final main = _MainStyle();
  final header = _HeaderStyle();
  final body = _LyricsStyle();
  final footer = _FooterStyle();

  UX({
    @required ThemeStore theme,
  }) : _theme = theme;

  final Duration transitionDuration = const Duration(milliseconds: 300);

  double get spacingUnit => main.spacingUnit;

  ThemeData get theme => _theme.theme;

  Color get primaryColor => theme.primaryColor;

  Color get textColor => theme.primaryColorLight;
}

class _MainStyle {
  final double spacingUnit = 4;
}

class _HeaderStyle {
  final double minHeight = 48;
  final double maxHeight = 80;

  final TextStyle nameTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1,
  );
  final TextStyle artistTextStyle = TextStyle(
    fontSize: 14,
    height: 1,
  );
}

class _LyricsStyle {
  final double infoIconSize = 48;
  final TextStyle lyricsTextStyle = TextStyle(
    fontSize: 12,
    height: 1.3,
  );
}

class _FooterStyle {
  final double height = 20;
}
