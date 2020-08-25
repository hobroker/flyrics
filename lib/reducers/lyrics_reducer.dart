import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/models/lyrics_state.dart';
import 'package:redux/redux.dart';

final lyricsReducer = combineReducers<LyricsState>([
  TypedReducer<LyricsState, FetchLyricsSuccessAction>((state, action) {
    return state.copyWith(
      text: action.result.text,
      isLoading: false,
    );
  }),
  TypedReducer<LyricsState, SearchStartAction>((state, action) {
    return state.copyWith(
      text: null,
      isLoading: true,
    );
  }),
]);
