import 'package:flutter/material.dart';
import 'package:flyrics/stores/theme.dart';

@immutable
class UX {
  final ThemeStore _theme;
  final header = _HeaderStyle(minHeight: 48, maxHeight: 80);
  final body = _LyricsStyle(infoIconSize: 48);
  final footer = _FooterStyle(height: 20);

  UX({
    @required ThemeStore theme,
  }) : _theme = theme;

  final Duration transitionDuration = const Duration(milliseconds: 300);
  final double spacingUnit = 4;

  ThemeData get theme => _theme.theme;

  Color get primaryColor => theme.primaryColor;

  Color get textColor => theme.primaryColorLight;
}

class _HeaderStyle {
  final double minHeight;
  final double maxHeight;

  _HeaderStyle({this.minHeight, this.maxHeight});
}

class _LyricsStyle {
  final double infoIconSize;

  _LyricsStyle({this.infoIconSize});
}

class _FooterStyle {
  final double height;

  _FooterStyle({this.height});
}
