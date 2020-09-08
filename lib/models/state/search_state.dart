import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flyrics/models/search_result.dart';

part 'search_state.g.dart';

abstract class SearchState implements Built<SearchState, SearchStateBuilder> {
  bool get isLoading;

  BuiltList<SearchResult> get results;

  SearchState._();

  factory SearchState([void Function(SearchStateBuilder) updates]) =
      _$SearchState;

  static void _initializeBuilder(SearchStateBuilder builder) => builder
    ..isLoading = false;
}
