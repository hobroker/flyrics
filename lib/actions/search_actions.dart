import 'package:flyrics/models/search_result_model.dart';
import 'package:flyrics/store/action.dart';

class SearchStartAction with Action {}

class SearchSuccessAction {
  final List<SearchResultModel> results;

  SearchSuccessAction(this.results);

  @override
  String toString() => '${runtimeType}(<SearchResultModel>[...])';
}
