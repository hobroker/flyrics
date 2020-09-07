import 'package:built_collection/built_collection.dart';
import 'package:flyrics/models/search_result.dart';
import 'package:flyrics/store/action.dart';

class SearchStartAction with ReduxAction {}

class SearchSuccessAction with ReduxAction {
  final BuiltList<SearchResult> results;

  SearchSuccessAction(this.results);

  @override
  List get args => ['<SearchResultModel>[...]'];
}
