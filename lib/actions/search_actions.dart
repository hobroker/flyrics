import 'package:flyrics/models/search_result.dart';

class SearchLyricsStartAction {}

class SearchLyricsSuccessAction {
  final List<SearchResult> results;

  SearchLyricsSuccessAction(this.results);
}
