import 'package:flyrics/models/track_state.dart';
import 'package:redux/redux.dart';

import 'package:flyrics/actions/track_actions.dart';

final trackReducer = combineReducers<TrackState>([
  TypedReducer<TrackState, FetchTrackStartAction>((state, action) {
    return TrackState(
      track: null,
      artworkBytes: null,
    );
  }),
  TypedReducer<TrackState, FetchTrackSuccessAction>((state, action) {
    return TrackState(
      track: action.track,
      artworkBytes: null,
    );
  }),
  TypedReducer<TrackState, FetchArtworkBytesSuccessAction>((state, action) {
    return TrackState(
      track: state.track,
      artworkBytes: action.artworkBytes,
    );
  }),
  TypedReducer<TrackState, FetchArtworkColorsSuccessAction>((state, action) {
    return TrackState(
      track: state.track,
      artworkBytes: state.artworkBytes,
      textColor: action.textColor,
      backgroundColor: action.backgroundColor,
    );
  }),
]);
