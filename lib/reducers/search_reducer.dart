import 'package:built_collection/built_collection.dart';
import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/models/search_result.dart';
import 'package:flyrics/models/state/search_state.dart';
import 'package:flyrics/modules/store/reducer_util.dart';
import 'package:redux/redux.dart';

final _isLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, SearchStartAction>(reduceTrue),
  TypedReducer<bool, SearchSuccessAction>(reduceFalse),
]);

final _resultsReducer = combineReducers<ListBuilder<SearchResult>>([
  TypedReducer<ListBuilder<SearchResult>, SearchStartAction>(
      reduceAlways<ListBuilder<SearchResult>>(ListBuilder<SearchResult>())),
  TypedReducer<ListBuilder<SearchResult>, SearchSuccessAction>(
      (state, action) => action.results.toBuilder()),
]);

final searchReducer = (SearchStateBuilder state, action) => SearchStateBuilder()
  ..isLoading = _isLoadingReducer(state.isLoading, action)
  ..results = _resultsReducer(state.results, action);
