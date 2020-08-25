import 'package:flutter/foundation.dart';
import 'package:flyrics/models/search_result.dart';

@immutable
class SearchState {
  final List<SearchResult> results;
  final bool isLoading;

  const SearchState({
    this.isLoading,
    this.results,
  });

  SearchState copyWith({isLoading, results}) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
    );
  }

  @override
  bool operator ==(other) {
    return other is SearchState &&
        other.isLoading == isLoading &&
        other.results == results;
  }

  @override
  int get hashCode => super.hashCode;
}
