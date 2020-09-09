import 'package:built_collection/built_collection.dart';
import 'package:flyrics/models/search_result.dart';
import 'package:flyrics/modules/store/action.dart';

class SearchStartAction with ReduxAction {}

class SearchSuccessAction with ReduxAction {
  final BuiltList<SearchResult> payload;

  SearchSuccessAction(this.payload);

  @override
  List get args => ['BuiltList<SearchResult>[...]'];
}
