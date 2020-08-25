import 'package:flutter/foundation.dart';
import 'package:flyrics/models/state/artwork_state.dart';
import 'package:flyrics/models/state/lyrics_state.dart';
import 'package:flyrics/models/state/player_state.dart';
import 'package:flyrics/models/state/search_state.dart';
import 'package:flyrics/models/state/timer_state.dart';
import 'package:flyrics/models/state/track_state.dart';

@immutable
class AppState {
  final PlayerState player;
  final TrackState track;
  final ArtworkState artwork;
  final SearchState search;
  final LyricsState lyrics;
  final TimerState timer;

  AppState({
    this.player,
    this.timer,
    this.track,
    this.artwork,
    this.search,
    this.lyrics,
  });

  factory AppState.init() {
    return AppState(
      player: PlayerState.init(),
      timer: TimerState.init(),
      track: TrackState.init(),
      artwork: ArtworkState.init(),
      search: SearchState.init(),
      lyrics: LyricsState.init(),
    );
  }

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
