import 'package:flyrics/actions/player_actions.dart';
import 'package:flyrics/models/state/player_state.dart';
import 'package:redux/redux.dart';

final _isRunningReducer = combineReducers<bool>([
  TypedReducer<bool, SetIsRunningAction>((state, action) => action.payload),
]);

final playerReducer = (PlayerStateBuilder b, action) =>
    b..isRunning = _isRunningReducer(b.isRunning, action);
