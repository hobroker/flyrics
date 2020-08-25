import 'package:flyrics/actions/is_running_actions.dart';
import 'package:flyrics/models/new/player_state.dart';
import 'package:redux/redux.dart';

final playerReducer = combineReducers<PlayerState>([
  TypedReducer<PlayerState, SetIsRunningAction>((state, action) {
    return state.copyWith(
      isRunning: action.isRunning,
    );
  }),
]);
