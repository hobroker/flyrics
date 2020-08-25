import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/models/state/track_state.dart';
import 'package:flyrics/utils/map.dart';
import 'package:redux/redux.dart';

final trackReducer = combineReducers<TrackState>([
  TypedReducer<TrackState, FetchTrackStartAction>((state, action) {
    return state.copyWith(
      isLoading: true,
    );
  }),
  TypedReducer<TrackState, FetchTrackSuccessAction>((state, action) {
    return state.copyWith(
      isLoading: false,
      byId: setMapValue(state.byId, action.track.id, action.track),
      activeId: action.track.id,
    );
  }),
]);
