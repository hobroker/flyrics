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

  return state.rebuild((b) => b
  ..track = trackReducer(b.track, action)
  ..player = playerReducer(b.player, action)
  ..artwork = artworkStateReducer(b.artwork, action)
  ..search = searchReducer(b.search, action)
  ..lyrics = lyricsReducer(b.lyrics, action)
  ..timer = timerReducer(b.timer, action)
  );
}
