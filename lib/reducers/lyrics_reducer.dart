import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/models/lyrics_state.dart';
import 'package:redux/redux.dart';

final lyricsReducer = combineReducers<LyricsState>([
  TypedReducer<LyricsState, SearchLyricsStartAction>((state, action) {
    return state.copyWith(
      isLoading: true,
    );
  }),
]);
