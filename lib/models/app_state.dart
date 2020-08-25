import 'package:flutter/foundation.dart';
import 'package:flyrics/models/artwork_state.dart';
import 'package:flyrics/models/lyrics_state.dart';
import 'package:flyrics/models/search_state.dart';
import 'package:flyrics/models/timer_state.dart';
import 'package:flyrics/models/track.dart';

@immutable
class AppState {
  final bool isRunning;
  final Track track;
  final ArtworkState artwork;
  final SearchState search;
  final LyricsState lyrics;
  final TimerState timer;

  AppState({
    this.isRunning = false,
    this.timer = const TimerState(),
    this.track = const Track(),
    this.artwork = const ArtworkState(),
    this.search = const SearchState(),
    this.lyrics = const LyricsState(),
  });

  @override
  bool operator ==(other) {
    return other is AppState &&
        other.isRunning == isRunning &&
        other.track == track &&
        other.lyrics == lyrics &&
        other.search == search &&
        other.timer == timer &&
        other.artwork == artwork;
  }

  @override
  int get hashCode => super.hashCode;
}
