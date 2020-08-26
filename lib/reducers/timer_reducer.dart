import 'package:flyrics/actions/timer_actions.dart';
import 'package:flyrics/models/state/timer_state.dart';
import 'package:redux/redux.dart';

final timerReducer = combineReducers<TimerState>([
  TypedReducer<TimerState, SetCheckIsRunningTimerAction>((state, action) {
    return state.copyWith(checkIsRunning: action.isRunning);
  }),
  TypedReducer<TimerState, SetRefreshTrackTimerAction>((state, action) {
    return state.copyWith(refreshTrack: action.value);
  }),
]);
