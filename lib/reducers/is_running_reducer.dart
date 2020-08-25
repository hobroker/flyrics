import 'package:flyrics/actions/is_running_actions.dart';
import 'package:redux/redux.dart';

final isPlayingReducer = combineReducers<bool>([
  TypedReducer<bool, CheckIsRunningSuccessAction>((state, action) {
    return action.isRunning;
  }),
]);

//int _setLoaded(int state, CounterChangedAction action) {
//  return action.dot;
//}
