import 'dart:ui';

import 'package:flyrics/store/action.dart';

class FetchArtworkBytesStartAction with ReduxAction {
  final String id;
  final String url;

  FetchArtworkBytesStartAction(this.url, {this.id});

  @override
  List get args => [id, url];
}

class FetchArtworkBytesSuccessAction with ReduxAction {
  final String id;
  final List<int> bytes;

  FetchArtworkBytesSuccessAction(this.bytes, {this.id});

  @override
  List get args => ['[...]', id];
}

class SetArtworkAsMissingAction with ReduxAction {}

class ResetArtworkColorsAction with ReduxAction {}

class SetArtworkColorsAction with ReduxAction {
  final String id;
  final Color textColor;
  final Color dominantColor;
  final List<Color> colors;

  SetArtworkColorsAction({
    this.textColor,
    this.dominantColor,
    this.colors,
    this.id,
  });

  @override
  List get args => [textColor, dominantColor, '<Color>[...]', id];
}
