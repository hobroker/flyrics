import 'package:flutter/foundation.dart';
import 'package:flyrics/models/artwork_state.dart';
import 'package:flyrics/models/new/lyrics_state.dart';
import 'package:flyrics/models/new/player_state.dart';
import 'package:flyrics/models/new/track_state.dart';
import 'package:flyrics/models/search_state.dart';
import 'package:flyrics/models/timer_state.dart';

@immutable
class AppState {
  final PlayerState player;
  final TrackState track;
  final ArtworkState artwork;
  final SearchState search;
  final LyricsState lyrics;
  final TimerState timer;

  AppState({
    this.player = const PlayerState(isRunning: false),
    this.timer = const TimerState(),
    this.track = const TrackState(byId: {}, isLoading: false),
    this.artwork = const ArtworkState(),
    this.search = const SearchState(),
    this.lyrics = const LyricsState(byId: {}, isLoading: false),
  });

  @override
  bool operator ==(other) {
    return other is AppState &&
        other.player == player &&
        other.track == track &&
        other.lyrics == lyrics &&
        other.search == search &&
        other.timer == timer &&
        other.artwork == artwork;
  }

  @override
  int get hashCode => super.hashCode;
}
