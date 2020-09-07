import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_result.g.dart';

abstract class SearchResult
    implements Built<SearchResult, SearchResultBuilder> {
  @BuiltValueField(wireName: 'full_title')
  String get title;

  String get url;

  SearchResult._();

  factory SearchResult([void Function(SearchResultBuilder) updates]) =
      _$SearchResult;

  static Serializer<SearchResult> get serializer => _$searchResultSerializer;

  static void _initializeBuilder(SearchResultBuilder builder) => builder;
}
