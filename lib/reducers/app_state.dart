import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/reducers/is_running_reducer.dart';
import 'package:flyrics/reducers/track_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    trackState: trackReducer(state.trackState, action),
    isRunning: isPlayingReducer(state.isRunning, action),
  );
}
