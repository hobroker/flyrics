import 'package:flyrics/models/track_state.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/actions/track_actions.dart';

final trackReducer = combineReducers<TrackState>([
  TypedReducer<TrackState, FetchTrackSuccessAction>((state, action) {
    if (action.track == state.track) {
      return state;
    }

    return state.copyWith(
      track: action.track,
      shouldUpdateArtwork: true,
    );
  }),
  TypedReducer<TrackState, FetchArtworkBytesSuccessAction>((state, action) {
    return state.copyWith(
      artworkBytes: action.artworkBytes,
      shouldUpdateArtwork: false,
    );
  }),
  TypedReducer<TrackState, FetchArtworkColorsSuccessAction>((state, action) {
    return state.copyWith(
      textColor: action.textColor,
      backgroundColor: action.backgroundColor,
    );
  }),
]);
