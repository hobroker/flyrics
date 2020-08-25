import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/models/state/lyrics_state.dart';
import 'package:flyrics/utils/hash_map_extension.dart';
import 'package:redux/redux.dart';

final lyricsReducer = combineReducers<LyricsState>([
  TypedReducer<LyricsState, FetchLyricsSuccessAction>((state, action) {
    return state.copyWith(
      byId: state.byId.setValue(action.id, action.result),
      isLoading: false,
    );
  }),
  TypedReducer<LyricsState, SetLyricsLoadingAction>((state, action) {
    return state.copyWith(
      isLoading: true,
    );
  }),
]);
