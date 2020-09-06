import 'package:flyrics/actions/player_actions.dart';
import 'package:flyrics/models/state/player_state.dart';
import 'package:redux/redux.dart';

final _isRunningReducer = combineReducers<bool>([
  TypedReducer<bool, SetIsRunningAction>((state, action) => action.isRunning),
]);

final playerReducer = (PlayerState state, action) => PlayerState(
      isRunning: _isRunningReducer(state.isRunning, action),
    );
