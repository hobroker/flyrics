import 'package:flutter/material.dart';
import 'package:flyrics/models/track.dart';

class FetchTrackStartAction {}

class FetchTrackSuccessAction {
  final Track track;

  FetchTrackSuccessAction(this.track);
}

class FetchArtworkBytesSuccessAction {
  final List<int> artworkBytes;

  FetchArtworkBytesSuccessAction(this.artworkBytes);
}

class FetchArtworkColorsSuccessAction {
  final Color backgroundColor;
  final Color textColor;

  FetchArtworkColorsSuccessAction({
    this.backgroundColor,
    this.textColor,
  });
}
