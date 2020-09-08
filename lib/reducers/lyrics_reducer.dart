import 'package:built_collection/built_collection.dart';
import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/models/lyrics_model.dart';
import 'package:flyrics/models/state/lyrics_state.dart';
import 'package:flyrics/modules/store/reducer_util.dart';
import 'package:redux/redux.dart';

final _isLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, FetchLyricsStartAction>(reduceTrue),
  TypedReducer<bool, SetLyricsLoadingAction>(reduceTrue),
  TypedReducer<bool, FetchLyricsSuccessAction>(reduceFalse),
]);

final _byIdReducer = combineReducers<MapBuilder<String, LyricsModel>>([
  TypedReducer<MapBuilder<String, LyricsModel>, FetchLyricsStartAction>(
      (state, action) =>
          state..[action.id] = LyricsModel((b) => b..url = action.url)),
  TypedReducer<MapBuilder<String, LyricsModel>, FetchLyricsSuccessAction>(
    (state, action) => state
      ..[action.id] = state[action.id].rebuild(
        (b) => b..text = action.text,
      ),
  ),
]);

final lyricsReducer = (LyricsStateBuilder state, action) => LyricsStateBuilder()
  ..isLoading = _isLoadingReducer(state.isLoading, action)
  ..byId = _byIdReducer(state.byId, action);
