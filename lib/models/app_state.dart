import 'package:flutter/foundation.dart';
import 'package:flyrics/models/track.dart';

@immutable
class AppState {
  final bool isRunning;
  final Track track;

  AppState({
    this.isRunning,
    this.track,
  });

  factory AppState.loading() => AppState(
        isRunning: false,
        track: null,
      );
}
