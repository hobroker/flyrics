import 'dart:ui';

class FetchArtworkBytesStartAction {
  final String url;

  FetchArtworkBytesStartAction(this.url);
}

class FetchArtworkBytesSuccessAction {
  final List<int> bytes;

  FetchArtworkBytesSuccessAction(this.bytes);
}

class SetArtworkAsMissingAction {}

class ResetArtworkColorsAction {}

class SetArtworkColorsAction {
  final Color textColor;
  final List<Color> colors;

  SetArtworkColorsAction({
    this.textColor,
    this.colors,
  });
}
