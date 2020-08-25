import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/models/lyrics_state.dart';
import 'package:redux/redux.dart';

final lyricsReducer = combineReducers<LyricsState>([
  TypedReducer<LyricsState, FetchLyricsStartAction>((state, action) {
    return state.copyWith(
      isLoading: true,
    );
  }),
  TypedReducer<LyricsState, FetchLyricsSuccessAction>((state, action) {
    return state.copyWith(
      text: action.text,
      isLoading: false,
    );
  }),
]);
