import 'package:flyrics/models/search_result_model.dart';

class SearchStartAction {}

class SearchSuccessAction {
  final List<SearchResultModel> results;

  SearchSuccessAction(this.results);
}
