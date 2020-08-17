import 'package:redux/redux.dart';

import 'package:flyrics/models/track.dart';
import 'package:flyrics/actions/track_actions.dart';

final trackReducer = combineReducers<Track>([
  TypedReducer<Track, FetchTrackStartAction>((state, action) {
    return null;
  }),
  TypedReducer<Track, FetchTrackSuccessAction>((state, action) {
    return action.track;
  }),
]);

//int _setLoaded(int state, CounterChangedAction action) {
//  return action.dot;
//}
