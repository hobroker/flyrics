import 'package:flutter/foundation.dart';
import 'package:flyrics/models/track_state.dart';

@immutable
class AppState {
  final bool isRunning;
  final TrackState trackState;

  AppState({
    this.isRunning: false,
    this.trackState: const TrackState(),
  });

  factory AppState.loading() => AppState(
        isRunning: false,
        trackState: TrackState(),
      );
}
