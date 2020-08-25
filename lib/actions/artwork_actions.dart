import 'dart:ui';

class FetchArtworkBytesStartAction {
  final String id;
  final String url;

  FetchArtworkBytesStartAction(this.url, {this.id});
}

class FetchArtworkBytesSuccessAction {
  final String id;
  final List<int> bytes;

  FetchArtworkBytesSuccessAction(this.bytes, {this.id});
}

class SetArtworkAsMissingAction {}

class SetArtworkColorsAction {
  final String id;
  final Color textColor;
  final List<Color> colors;

  SetArtworkColorsAction({
    this.textColor,
    this.colors,
    this.id,
  });
}
