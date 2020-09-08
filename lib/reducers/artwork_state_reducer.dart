import 'package:built_collection/built_collection.dart';
import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/models/state/artwork_state.dart';
import 'package:flyrics/modules/store/reducer_util.dart';
import 'package:redux/redux.dart';

final _isLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, FetchArtworkBytesStartAction>(reduceTrue),
  TypedReducer<bool, FetchArtworkBytesSuccessAction>(reduceFalse),
  TypedReducer<bool, SetArtworkAsMissingAction>(reduceFalse),
]);

final _byIdReducer = combineReducers<MapBuilder<String, ArtworkModel>>([
  TypedReducer<MapBuilder<String, ArtworkModel>, FetchArtworkBytesStartAction>(
    (state, action) => state
      ..[action.id] = ArtworkModel((b) => b
        ..url = action.url
        ..bytes = []
        ..colors = []
        ..dominantColor = null
        ..textColor = null),
  ),
  TypedReducer<MapBuilder<String, ArtworkModel>,
      FetchArtworkBytesSuccessAction>((state, action) {
    state
      ..[action.id] = state[action.id].rebuild(
        (b) => b..bytes = action.bytes,
      );

    return state;
  }),
  TypedReducer<MapBuilder<String, ArtworkModel>, SetArtworkColorsAction>(
    (state, action) => state
      ..[action.id] = state[action.id].rebuild(
        (b) => b
          ..textColor = action.textColor
          ..dominantColor = action.dominantColor
          ..colors = action.colors,
      ),
  ),
]);

final artworkStateReducer =
    (ArtworkStateBuilder state, action) => ArtworkStateBuilder()
      ..isLoading = _isLoadingReducer(state.isLoading, action)
      ..byId = _byIdReducer(state.byId, action);
