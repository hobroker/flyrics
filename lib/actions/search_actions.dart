import 'package:flyrics/models/search_result_model.dart';
import 'package:flyrics/store/action.dart';

class SearchStartAction with ReduxAction {}

class SearchSuccessAction with ReduxAction {
  final List<SearchResultModel> results;

  SearchSuccessAction(this.results);

  @override
  List get args => ['<SearchResultModel>[...]'];
}
