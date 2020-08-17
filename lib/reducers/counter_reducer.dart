import 'package:flyrics/actions/actions.dart';
import 'package:redux/redux.dart';

final counterReducer = combineReducers<int>([
  TypedReducer<int, CounterIncrementAction>((state, action) {
    return state + 1;
  }),
  TypedReducer<int, CounterAddAction>((state, action) {
    return state + action.dot;
  }),
]);

//int _setLoaded(int state, CounterChangedAction action) {
//  return action.dot;
//}
