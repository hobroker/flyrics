import 'package:flyrics/models/track_state.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/actions/track_actions.dart';

final trackReducer = combineReducers<TrackState>([
  TypedReducer<TrackState, FetchTrackStartAction>((state, action) {
    return TrackState();
  }),
  TypedReducer<TrackState, FetchTrackSuccessAction>((state, action) {
    return state.copyWith(
      track: action.track,
    );
  }),
  TypedReducer<TrackState, FetchArtworkBytesSuccessAction>((state, action) {
    return state.copyWith(
      artworkBytes: action.artworkBytes,
    );
  }),
  TypedReducer<TrackState, FetchArtworkColorsSuccessAction>((state, action) {
    return state.copyWith(
      textColor: action.textColor,
      backgroundColor: action.backgroundColor,
    );
  }),
]);
