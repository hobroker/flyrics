import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/models/state/artwork_state.dart';
import 'package:flyrics/utils/map.dart';
import 'package:redux/redux.dart';

final artworkStateReducer = combineReducers<ArtworkState>([
  TypedReducer<ArtworkState, FetchArtworkBytesStartAction>((state, action) {
    return state.copyWith(
      byId: setMapValue(
          state.byId,
          action.id,
          ArtworkModel(
            url: action.url,
            bytes: null,
          )),
      isLoading: true,
    );
  }),
  TypedReducer<ArtworkState, FetchArtworkBytesSuccessAction>((state, action) {
    return state.copyWith(
      byId: updateMap<String, ArtworkModel>(state.byId, {
        action.id: (artwork) => artwork.copyWith(
              bytes: action.bytes
            ),
      }),
      isLoading: false,
    );
  }),
  TypedReducer<ArtworkState, SetArtworkColorsAction>((state, action) {
    return state.copyWith(
      byId: updateMap<String, ArtworkModel>(state.byId, {
        action.id: (artwork) => artwork.copyWith(
              textColor: action.textColor,
              colors: action.colors,
            ),
      }),
    );
  }),
  TypedReducer<ArtworkState, SetArtworkAsMissingAction>((state, action) {
    return state.copyWith(
      isLoading: false,
    );
  }),
]);
