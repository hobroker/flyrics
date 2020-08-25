import 'package:flutter/foundation.dart';
import 'package:flyrics/models/artwork_state.dart';
import 'package:flyrics/models/track.dart';

@immutable
class AppState {
  final bool isRunning;
  final Track track;
  final ArtworkState artworkState;

  AppState({
    this.isRunning: false,
    this.track: const Track(),
    this.artworkState: const ArtworkState(),
  });
}
