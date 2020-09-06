import 'package:flyrics/actions/timer_actions.dart';
import 'package:flyrics/models/state/timer_state.dart';
import 'package:redux/redux.dart';

final _checkIsRunning = combineReducers<bool>([
  TypedReducer<bool, SetCheckIsRunningTimerAction>(
      (state, action) => action.isRunning),
]);

final _refreshTrack = combineReducers<bool>([
  TypedReducer<bool, SetRefreshTrackTimerAction>(
      (state, action) => action.value),
]);

final timerReducer = (TimerState state, action) => TimerState(
      refreshTrack: _refreshTrack(state.refreshTrack, action),
      checkIsRunning: _checkIsRunning(state.checkIsRunning, action),
    );
