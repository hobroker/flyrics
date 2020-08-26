import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/models/state/artwork_state.dart';
import 'package:flyrics/modules/hash_map_extension.dart';
import 'package:redux/redux.dart';

final artworkStateReducer = combineReducers<ArtworkState>([
  TypedReducer<ArtworkState, FetchArtworkBytesStartAction>((state, action) {
    return state.copyWith(
      byId: state.byId.setEntry(
          action.id,
          ArtworkModel(
            url: action.url,
            dominantColor: null,
          )),
      isLoading: true,
    );
  }),
  TypedReducer<ArtworkState, FetchArtworkBytesSuccessAction>((state, action) {
    return state.copyWith(
      byId: state.byId.updateEntry(
          action.id, (artwork) => artwork.copyWith(bytes: action.bytes)),
      isLoading: false,
    );
  }),
  TypedReducer<ArtworkState, SetArtworkColorsAction>((state, action) {
    return state.copyWith(
      byId: state.byId.updateEntry(
        action.id,
        (artwork) => artwork.copyWith(
          textColor: action.textColor,
          dominantColor: action.dominantColor,
          colors: action.colors,
        ),
      ),
    );
  }),
  TypedReducer<ArtworkState, SetArtworkAsMissingAction>((state, action) {
    return state.copyWith(
      isLoading: false,
    );
  }),
]);
