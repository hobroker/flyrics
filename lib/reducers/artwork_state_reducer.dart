import 'dart:collection';

import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/models/state/artwork_state.dart';
import 'package:flyrics/modules/hash_map_extension.dart';
import 'package:flyrics/store/reducer_util.dart';
import 'package:redux/redux.dart';

final _isLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, FetchArtworkBytesStartAction>(reduceTrue),
  TypedReducer<bool, FetchArtworkBytesSuccessAction>(reduceFalse),
  TypedReducer<bool, SetArtworkAsMissingAction>(reduceFalse),
]);

final _byIdReducer = combineReducers<HashMap<String, ArtworkModel>>([
  TypedReducer<HashMap<String, ArtworkModel>, FetchArtworkBytesStartAction>(
      (state, action) => state.setEntry(
          action.id,
          ArtworkModel(
            url: action.url,
            dominantColor: null,
          ))),
  TypedReducer<HashMap<String, ArtworkModel>, FetchArtworkBytesSuccessAction>(
      (state, action) => state.updateEntry(
          action.id, (artwork) => artwork.copyWith(bytes: action.bytes))),
  TypedReducer<HashMap<String, ArtworkModel>, SetArtworkColorsAction>(
      (state, action) => state.updateEntry(
            action.id,
            (artwork) => artwork.copyWith(
              textColor: action.textColor,
              dominantColor: action.dominantColor,
              colors: action.colors,
            ),
          )),
]);

final artworkStateReducer = (ArtworkState state, action) => ArtworkState(
      isLoading: _isLoadingReducer(state.isLoading, action),
      byId: _byIdReducer(state.byId, action),
    );
