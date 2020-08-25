import 'package:flutter/material.dart';
import 'package:flyrics/models/track.dart';

class FetchTrackStartAction {}
class RefreshTrackAction {}

class FetchTrackSuccessAction {
  final Track track;

  FetchTrackSuccessAction(this.track);
}

class FetchArtworkBytesSuccessAction {
  final List<int> bytes;

  FetchArtworkBytesSuccessAction(this.bytes);
}

class FetchArtworkColorsSuccessAction {
  final Color dominantColor;
  final Color textColor;

  FetchArtworkColorsSuccessAction({
    this.dominantColor,
    this.textColor,
  });
}
