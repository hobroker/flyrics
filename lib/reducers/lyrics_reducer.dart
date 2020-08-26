import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/models/lyrics_model.dart';
import 'package:flyrics/models/state/lyrics_state.dart';
import 'package:flyrics/modules/hash_map_extension.dart';
import 'package:redux/redux.dart';

final lyricsReducer = combineReducers<LyricsState>([
  TypedReducer<LyricsState, FetchLyricsStartAction>((state, action) {
    return state.copyWith(
      isLoading: true,
      byId: state.byId.setEntry(action.id, LyricsModel(url: action.url)),
    );
  }),
  TypedReducer<LyricsState, FetchLyricsSuccessAction>((state, action) {
    return state.copyWith(
      isLoading: false,
      byId: state.byId.updateEntry(
          action.id,
          (entry) => entry != null
              ? entry.copyWith(text: action.text)
              : LyricsModel(text: action.text)),
    );
  }),
  TypedReducer<LyricsState, SetLyricsLoadingAction>((state, action) {
    return state.copyWith(
      isLoading: true,
    );
  }),
]);
