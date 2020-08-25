import 'package:flutter/foundation.dart';
import 'package:flyrics/models/meta.dart';
import 'package:flyrics/models/track_state.dart';

@immutable
class AppState {
  final bool isRunning;
  final TrackState trackState;
  final Meta meta;

  AppState({
    this.isRunning,
    this.trackState,
    this.meta,
  });

  factory AppState.loading() => AppState(
        isRunning: false,
        meta: null,
        trackState: TrackState(
          track: null,
          artworkBytes: null,
        ),
      );
}
