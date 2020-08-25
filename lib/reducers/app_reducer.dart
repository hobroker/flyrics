import 'package:flyrics/models/app_state.dart';

import 'artwork_state_reducer.dart';
import 'is_running_reducer.dart';
import 'lyrics_reducer.dart';
import 'search_reducer.dart';
import 'timer_reducer.dart';
import 'track_reducer.dart';

AppState appReducer(AppState state, action) {
  if (action == null) {
    return state;
  }

  return AppState(
    track: trackReducer(state.track, action),
    isRunning: isRunningReducer(state.isRunning, action),
    artwork: artworkStateReducer(state.artwork, action),
    search: searchReducer(state.search, action),
    lyrics: lyricsReducer(state.lyrics, action),
    timer: timerReducer(state.timer, action),
  );
}
