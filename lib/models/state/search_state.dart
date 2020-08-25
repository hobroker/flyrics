import 'package:flutter/foundation.dart';
import 'package:flyrics/models/search_result_model.dart';

@immutable
class SearchState {
  final bool isLoading;
  final List<SearchResultModel> results;

  const SearchState({
    this.isLoading,
    this.results,
  });

  factory SearchState.init() {
    return SearchState(
      isLoading: false,
      results: [],
    );
  }

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
