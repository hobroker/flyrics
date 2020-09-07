import 'package:flyrics/models/state/app_state.dart';

import 'artwork_state_reducer.dart';
import 'lyrics_reducer.dart';
import 'player_reducer.dart';
import 'search_reducer.dart';
import 'timer_reducer.dart';
import 'track_reducer.dart';

AppState appReducer(AppState state, action) {
  if (action == null) {
    return state;
  }

  return AppState(
    track: trackReducer(state.track, action),
    player: playerReducer(state.player.toBuilder(), action).build(),
    artwork: artworkStateReducer(state.artwork.toBuilder(), action).build(),
    search: searchReducer(state.search, action),
    lyrics: lyricsReducer(state.lyrics, action),
    timer: timerReducer(state.timer, action),
  );
}
