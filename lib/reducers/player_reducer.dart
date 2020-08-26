import 'package:flyrics/actions/player_actions.dart';
import 'package:flyrics/models/state/player_state.dart';
import 'package:redux/redux.dart';

final playerReducer = combineReducers<PlayerState>([
  TypedReducer<PlayerState, SetIsRunningAction>((state, action) {
    return state.copyWith(
      isRunning: action.isRunning,
    );
  }),
]);
