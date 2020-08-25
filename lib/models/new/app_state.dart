import 'package:flutter/foundation.dart';
import 'package:flyrics/models/new/artwork_state.dart';
import 'package:flyrics/models/new/lyrics_state.dart';
import 'package:flyrics/models/new/player_state.dart';
import 'package:flyrics/models/new/search_state.dart';
import 'package:flyrics/models/new/timer_state.dart';
import 'package:flyrics/models/new/track_state.dart';

@immutable
class AppState {
  final PlayerState player;
  final TrackState track;
  final ArtworkState artwork;
  final SearchState search;
  final LyricsState lyrics;
  final TimerState timer;

  AppState({
    this.player = const PlayerState(
      isRunning: false,
    ),
    this.timer = const TimerState(
      refreshTrack: false,
    ),
    this.track = const TrackState(
      isLoading: false,
      byId: {},
    ),
    this.artwork = const ArtworkState(
      isLoading: false,
      byId: {},
    ),
    this.search = const SearchState(
      isLoading: false,
      results: [],
    ),
    this.lyrics = const LyricsState(
      isLoading: false,
      byId: {},
    ),
  });

  @override
  bool operator ==(other) {
    return other is AppState &&
        other.player == player &&
        other.track == track &&
        other.artwork == artwork &&
        other.search == search &&
        other.lyrics == lyrics &&
        other.timer == timer;
  }

  @override
  int get hashCode => super.hashCode;
}
