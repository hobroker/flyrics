import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/reducers/search_reducer.dart';

import 'artwork_state_reducer.dart';
import 'is_running_reducer.dart';
import 'track_reducer.dart';

AppState appReducer(AppState state, action) {
  if (action == null) {
    return state;
  }

  return AppState(
    track: trackReducer(state.track, action),
    isRunning: isPlayingReducer(state.isRunning, action),
    artwork: artworkStateReducer(state.artwork, action),
    search: searchReducer(state.search, action),
  );
}
