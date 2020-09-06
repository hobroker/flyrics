import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/models/search_result_model.dart';
import 'package:flyrics/models/state/search_state.dart';
import 'package:flyrics/store/reducer_util.dart';
import 'package:redux/redux.dart';

final _isLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, SearchStartAction>(reduceTrue),
  TypedReducer<bool, SearchSuccessAction>(reduceFalse),
]);

final _resultsReducer = combineReducers<List<SearchResultModel>>([
  TypedReducer<List<SearchResultModel>, SearchStartAction>(
      reduceAlways<List<SearchResultModel>>([])),
  TypedReducer<List<SearchResultModel>, SearchSuccessAction>(
      (state, action) => action.results),
]);

final searchReducer = (SearchState state, action) => SearchState(
      isLoading: _isLoadingReducer(state.isLoading, action),
      results: _resultsReducer(state.results, action),
    );
