import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/models/track.dart';

@immutable
class TrackState {
  final Track track;
  final List<int> artworkBytes;
  final Color backgroundColor;
  final Color textColor;

  const TrackState({
    this.track: const Track(),
    this.artworkBytes,
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
  }) {
    return TrackState(
      track: track ?? this.track,
      artworkBytes: artworkBytes ?? this.artworkBytes,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }
}
