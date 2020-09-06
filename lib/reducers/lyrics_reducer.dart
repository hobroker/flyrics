import 'dart:collection';

import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/models/lyrics_model.dart';
import 'package:flyrics/models/state/lyrics_state.dart';
import 'package:flyrics/modules/hash_map_extension.dart';
import 'package:flyrics/store/reducer_util.dart';
import 'package:redux/redux.dart';

final _isLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, FetchLyricsStartAction>(reduceTrue),
  TypedReducer<bool, SetLyricsLoadingAction>(reduceTrue),
  TypedReducer<bool, FetchLyricsSuccessAction>(reduceFalse),
]);

final _byIdReducer = combineReducers<HashMap<String, LyricsModel>>([
  TypedReducer<HashMap<String, LyricsModel>, FetchLyricsStartAction>(
      (state, action) =>
          state.setEntry(action.id, LyricsModel(url: action.url))),
  TypedReducer<HashMap<String, LyricsModel>, FetchLyricsSuccessAction>(
      (state, action) => state.updateEntry(
          action.id,
          (LyricsModel entry) => entry != null
              ? entry.copyWith(text: action.text)
              : LyricsModel(text: action.text))),
]);

final lyricsReducer = (LyricsState state, action) => LyricsState(
      isLoading: _isLoadingReducer(state.isLoading, action),
      byId: _byIdReducer(state.byId, action),
    );
