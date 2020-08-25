import 'package:flyrics/models/search_result.dart';

class SearchStartAction {}

class SearchSuccessAction {
  final List<SearchResult> results;

  SearchSuccessAction(this.results);
}
