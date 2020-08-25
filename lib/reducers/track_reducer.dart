import 'package:flyrics/models/track.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/actions/track_actions.dart';

final trackReducer = combineReducers<Track>([
  TypedReducer<Track, FetchTrackSuccessAction>((state, action) {
    return action.track;
  }),
]);
