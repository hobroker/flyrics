import 'package:flutter/foundation.dart';

import 'artwork_state.dart';
import 'lyrics_state.dart';
import 'player_state.dart';
import 'search_state.dart';
import 'timer_state.dart';
import 'track_state.dart';

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
      player: PlayerStateBuilder().build(),
      timer: TimerStateBuilder().build(),
      track: TrackState.init(),
      artwork: ArtworkStateBuilder().build(),
      search: SearchStateBuilder().build(),
      lyrics: LyricsStateBuilder().build(),
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
