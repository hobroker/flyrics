import 'package:flutter/material.dart';
import 'package:flyrics/models/track.dart';

class FetchTrackStartAction {}

class CheckTrackAction {}

class FetchTrackSuccessAction {
  final Track track;

  FetchTrackSuccessAction(this.track);
}

class FetchArtworkBytesStartAction {}

class FetchArtworkBytesSuccessAction {
  final List<int> bytes;

  FetchArtworkBytesSuccessAction(this.bytes);
}

class FetchArtworkColorsSuccessAction {
  final Color textColor;
  final List<Color> colors;

  FetchArtworkColorsSuccessAction({
    this.textColor,
    this.colors,
  });
}
