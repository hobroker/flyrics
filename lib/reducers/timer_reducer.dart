import 'package:flyrics/actions/timer_actions.dart';
import 'package:flyrics/models/timer_state.dart';
import 'package:redux/redux.dart';

final timerReducer = combineReducers<TimerState>([
  TypedReducer<TimerState, StopRefreshTimerAction>((state, action) {
    return state.copyWith(refreshTrack: false);
  }),
  TypedReducer<TimerState, StartRefreshTimerAction>((state, action) {
    return state.copyWith(refreshTrack: true);
  }),
]);
