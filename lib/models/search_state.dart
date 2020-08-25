import 'package:flutter/foundation.dart';
import 'package:flyrics/models/search_result.dart';

@immutable
class SearchState {
  final List<SearchResult> items;
  final bool isLoading;

  const SearchState({
    this.isLoading = false,
    this.items = const [],
  });

  SearchState copyWith({isLoading, items}) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(other) {
    return other is SearchState &&
        other.isLoading == isLoading &&
        other.items == items;
  }

  @override
  int get hashCode => super.hashCode;
}
