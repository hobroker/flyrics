import 'package:flyrics/actions/timer_actions.dart';
import 'package:flyrics/models/state/timer_state.dart';
import 'package:flyrics/modules/store/reducer_util.dart';
import 'package:redux/redux.dart';

final _checkIsRunning = combineReducers<bool>([
  TypedReducer<bool, SetCheckIsRunningTimerAction>(reducePayload),
]);

final _refreshTrack = combineReducers<bool>([
  TypedReducer<bool, SetRefreshTrackTimerAction>(reducePayload),
]);

final timerReducer = (TimerStateBuilder state, action) => TimerStateBuilder()
  ..refreshTrack = _refreshTrack(state.refreshTrack, action)
  ..checkIsRunning = _checkIsRunning(state.checkIsRunning, action);
