import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/models/track.dart';

@immutable
class TrackState {
  final Track track;
  final List<int> artworkBytes;
  final Color backgroundColor;
  final Color textColor;

  TrackState({
    this.track,
    this.artworkBytes,
    this.backgroundColor,
    this.textColor,
  });
}
