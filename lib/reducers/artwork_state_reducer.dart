import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/models/state/artwork_state.dart';
import 'package:redux/redux.dart';

final artworkStateReducer = combineReducers<ArtworkState>([
  TypedReducer<ArtworkState, FetchArtworkBytesStartAction>((state, action) {
    var id = action.id;
    var byId = Map<String, ArtworkModel>.from(state.byId);
    byId[id] = ArtworkModel(
      url: action.url,
      bytes: null,
    );

    return state.copyWith(
      byId: byId,
      isLoading: true,
    );
  }),
  TypedReducer<ArtworkState, FetchArtworkBytesSuccessAction>((state, action) {
    var id = action.id;
    var byId = Map<String, ArtworkModel>.from(state.byId);
    byId[id] = byId[id].copyWith(
      bytes: action.bytes,
    );

    return state.copyWith(
      byId: byId,
      isLoading: false,
    );
  }),
  TypedReducer<ArtworkState, SetArtworkColorsAction>((state, action) {
    var id = action.id;
    var byId = Map<String, ArtworkModel>.from(state.byId);
    byId[id] = byId[id].copyWith(
      textColor: action.textColor,
      colors: action.colors,
    );

    return state.copyWith(
      byId: byId,
    );
  }),
  TypedReducer<ArtworkState, SetArtworkAsMissingAction>((state, action) {
    return state.copyWith(
      isLoading: false,
    );
  }),
]);
