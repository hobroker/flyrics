import 'package:flyrics/models/artwork_state.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/actions/track_actions.dart';

final artworkStateReducer = combineReducers<ArtworkState>([
  TypedReducer<ArtworkState, FetchTrackSuccessAction>((state, action) {
    return state.copyWith(
      url: action.track.artwork,
      shouldRefresh: true,
    );
  }),
  TypedReducer<ArtworkState, FetchArtworkBytesSuccessAction>((state, action) {
    return state.copyWith(
      bytes: action.bytes,
      shouldRefresh: false,
    );
  }),
  TypedReducer<ArtworkState, FetchArtworkColorsSuccessAction>((state, action) {
    return state.copyWith(
      textColor: action.textColor,
      colors: action.colors,
    );
  }),
]);
