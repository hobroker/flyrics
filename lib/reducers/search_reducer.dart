import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/models/state/search_state.dart';
import 'package:redux/redux.dart';

final searchReducer = combineReducers<SearchState>([
  TypedReducer<SearchState, SearchStartAction>((state, action) {
    return SearchState(
      isLoading: true,
      results: [],
    );
  }),
  TypedReducer<SearchState, SearchSuccessAction>((state, action) {
    return state.copyWith(
      isLoading: false,
      results: action.results,
    );
  }),
]);
