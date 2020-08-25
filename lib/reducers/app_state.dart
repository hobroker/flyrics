import 'package:flyrics/models/app_state.dart';

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
    artworkState: artworkStateReducer(state.artworkState, action),
  );
}
