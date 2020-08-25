import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/models/state/lyrics_state.dart';
import 'package:flyrics/utils/map.dart';
import 'package:redux/redux.dart';

final lyricsReducer = combineReducers<LyricsState>([
  TypedReducer<LyricsState, FetchLyricsSuccessAction>((state, action) {
    return state.copyWith(
      byId: setMapValue(state.byId, action.id, action.result),
      isLoading: false,
    );
  }),
  TypedReducer<LyricsState, SearchStartAction>((state, action) {
    return state.copyWith(
      isLoading: true,
    );
  }),
]);
