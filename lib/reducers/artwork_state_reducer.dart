import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/models/artwork_state.dart';
import 'package:redux/redux.dart';

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
  TypedReducer<ArtworkState, SetArtworkColorsAction>((state, action) {
    return state.copyWith(
      textColor: action.textColor,
      colors: action.colors,
    );
  }),
  TypedReducer<ArtworkState, ResetArtworkColorsAction>((state, action) {
    return ArtworkState(
      isLoading: state.isLoading,
      bytes: state.bytes,
      url: state.url,
    );
  }),
  TypedReducer<ArtworkState, SetArtworkAsMissingAction>((state, action) {
    return state.copyWith(
      isLoading: false,
    );
  }),
]);
