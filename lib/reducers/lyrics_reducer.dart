import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/models/lyrics_model.dart';
import 'package:flyrics/models/state/lyrics_state.dart';
import 'package:flyrics/utils/hash_map_extension.dart';
import 'package:redux/redux.dart';

final lyricsReducer = combineReducers<LyricsState>([
  TypedReducer<LyricsState, FetchLyricsStartAction>((state, action) {
    return state.copyWith(
      byId: state.byId.setEntry(action.id, LyricsModel(url: action.url)),
      isLoading: false,
    );
  }),
  TypedReducer<LyricsState, FetchLyricsSuccessAction>((state, action) {
    return state.copyWith(
      byId: state.byId
          .updateEntry(action.id, (entry) => entry.copyWith(text: action.text)),
      isLoading: false,
    );
  }),
  TypedReducer<LyricsState, SetLyricsLoadingAction>((state, action) {
    return state.copyWith(
      isLoading: true,
    );
  }),
]);
