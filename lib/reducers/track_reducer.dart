import 'package:flyrics/models/new/track_state.dart';
import 'package:flyrics/models/track.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/actions/track_actions.dart';

final trackReducer = combineReducers<TrackState>([
  TypedReducer<TrackState, FetchTrackStartAction>((state, action) {
    return state.copyWith(
      isLoading: true,
    );
  }),
  TypedReducer<TrackState, FetchTrackSuccessAction>((state, action) {
    var id = action.track.id;
    var byId = Map<String, Track>.from(state.byId);
    byId[id] = action.track;

    return state.copyWith(
      byId: byId,
      activeId: id,
    );
  }),
]);
