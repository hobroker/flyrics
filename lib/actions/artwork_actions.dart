import 'dart:ui';

import 'package:flyrics/store/action.dart';

class FetchArtworkBytesStartAction with Action {
  final String id;
  final String url;

  FetchArtworkBytesStartAction(this.url, {this.id});

  @override
  String toString() => '${runtimeType}($url, id: $id)';
}

class FetchArtworkBytesSuccessAction with Action {
  final String id;
  final List<int> bytes;

  FetchArtworkBytesSuccessAction(this.bytes, {this.id});

  @override
  String toString() => '${runtimeType}([...], id: $id)';
}

class SetArtworkAsMissingAction with Action {}

class ResetArtworkColorsAction with Action {}

class SetArtworkColorsAction with Action {
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
  String toString() =>
      '${runtimeType}($textColor, $dominantColor, <Color>[...], $id)';
}
