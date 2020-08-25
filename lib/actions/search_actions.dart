import 'package:flyrics/models/search_result.dart';

class SearchStartAction {}

class SearchSuccessAction {
  final List<SearchResultModel> results;

  SearchSuccessAction(this.results);
}
