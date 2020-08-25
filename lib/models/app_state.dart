import 'package:flutter/foundation.dart';
import 'package:flyrics/models/meta.dart';
import 'package:flyrics/models/track.dart';

@immutable
class AppState {
  final bool isRunning;
  final Track track;
  final Meta meta;

  AppState({
    this.isRunning,
    this.track,
    this.meta,
  });

  factory AppState.loading() => AppState(
        isRunning: false,
        track: null,
        meta: null,
      );
}
