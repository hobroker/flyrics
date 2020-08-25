import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/models/track.dart';

@immutable
class TrackState {
  final Track track;
  final List<int> artworkBytes;
  final bool shouldUpdateArtwork;
  final Color backgroundColor;
  final Color textColor;

  const TrackState({
    this.track: const Track(),
    this.artworkBytes,
    this.shouldUpdateArtwork = true,
    this.backgroundColor,
    this.textColor,
  });

  TrackState rebuild(Function fn) {
    return fn(this);
  }

  copyWith({
    track,
    artworkBytes,
    backgroundColor,
    textColor,
    shouldUpdateArtwork,
  }) {
    return TrackState(
      track: track ?? this.track,
      artworkBytes: artworkBytes ?? this.artworkBytes,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      shouldUpdateArtwork: shouldUpdateArtwork ?? this.shouldUpdateArtwork,
    );
  }
}
