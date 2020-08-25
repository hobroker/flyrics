import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/models/lyrics.dart';
import 'package:flyrics/models/new/lyrics_state.dart';
import 'package:redux/redux.dart';

final lyricsReducer = combineReducers<LyricsState>([
  TypedReducer<LyricsState, FetchLyricsSuccessAction>((state, action) {
    var byId = Map<String, LyricsModel>.from(state.byId);
    var id = action.id;
    byId[id] = action.result;

    return state.copyWith(
      byId: byId,
      isLoading: false,
    );
  }),
  TypedReducer<LyricsState, SearchStartAction>((state, action) {
    return state.copyWith(
      isLoading: true,
    );
  }),
]);
