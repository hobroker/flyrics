import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/models/search_state.dart';
import 'package:redux/redux.dart';

final searchReducer = combineReducers<SearchState>([
  TypedReducer<SearchState, SearchLyricsStartAction>((state, action) {
    return state.copyWith(
      isLoading: true,
    );
  }),
  TypedReducer<SearchState, SearchLyricsSuccessAction>((state, action) {
    return state.copyWith(
      items: action.results,
      isLoading: false,
    );
  }),
]);
