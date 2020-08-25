import 'package:flyrics/models/artwork_state.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/actions/track_actions.dart';

final artworkStateReducer = combineReducers<ArtworkState>([
  TypedReducer<ArtworkState, FetchArtworkBytesStartAction>((state, action) {
    return state.copyWith(
      url: action.url,
      bytes: null,
      isLoading: true,
    );
  }),
  TypedReducer<ArtworkState, FetchArtworkBytesSuccessAction>((state, action) {
    return state.copyWith(
      bytes: action.bytes,
      isLoading: false,
    );
  }),
  TypedReducer<ArtworkState, FetchArtworkBytesStartAction>((state, action) {
    const newArtworkState = ArtworkState();
    return state.copyWith(
      textColor: newArtworkState.textColor,
      colors: newArtworkState.colors,
    );
  }),
  TypedReducer<ArtworkState, FetchArtworkColorsSuccessAction>((state, action) {
    return state.copyWith(
      textColor: action.textColor,
      colors: action.colors,
    );
  }),
  TypedReducer<ArtworkState, SetArtworkAsMissingAction>((state, action) {
    return state.copyWith(
      isLoading: false,
    );
  }),
]);
