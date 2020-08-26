import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/models/state/track_state.dart';
import 'package:flyrics/utils/hash_map_extension.dart';
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
      activeId: action.track.id,
      lastActiveId: state.activeId,
      byId: state.byId.setEntry(action.track.id, action.track),
    );
  }),
  TypedReducer<TrackState, ResetActiveIdAction>((state, action) {
    return TrackState(
      isLoading: state.isLoading,
      byId: state.byId,
      activeId: null,
      lastActiveId: null,
    );
  }),
]);
