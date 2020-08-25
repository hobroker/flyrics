import 'package:flyrics/actions/is_running_actions.dart';
import 'package:redux/redux.dart';

final isRunningReducer = combineReducers<bool>([
  TypedReducer<bool, SetIsRunningAction>((state, action) {
    return action.isRunning;
  }),
]);
