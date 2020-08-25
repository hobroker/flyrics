import 'package:flyrics/models/search_result_model.dart';

class SearchStartAction {
  @override
  String toString() => '${SearchStartAction}()';
}

class SearchSuccessAction {
  final List<SearchResultModel> results;

  SearchSuccessAction(this.results);

  @override
  String toString() => '${SearchSuccessAction}(<SearchResultModel>[...])';
}
