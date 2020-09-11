// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on SearchStoreBase, Store {
  Computed<String> _$activeResultUrlComputed;

  @override
  String get activeResultUrl => (_$activeResultUrlComputed ??= Computed<String>(
          () => super.activeResultUrl,
          name: 'SearchStoreBase.activeResultUrl'))
      .value;

  final _$isLoadingAtom = Atom(name: 'SearchStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$queryAtom = Atom(name: 'SearchStoreBase.query');

  @override
  String get query {
    _$queryAtom.reportRead();
    return super.query;
  }

  @override
  set query(String value) {
    _$queryAtom.reportWrite(value, super.query, () {
      super.query = value;
    });
  }

  final _$resultsAtom = Atom(name: 'SearchStoreBase.results');

  @override
  List<SearchItem> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(List<SearchItem> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$searchQueryAsyncAction = AsyncAction('SearchStoreBase.searchQuery');

  @override
  Future<dynamic> searchQuery(String str) {
    return _$searchQueryAsyncAction.run(() => super.searchQuery(str));
  }

  final _$openActiveResultInBrowserAsyncAction =
      AsyncAction('SearchStoreBase.openActiveResultInBrowser');

  @override
  Future<dynamic> openActiveResultInBrowser() {
    return _$openActiveResultInBrowserAsyncAction
        .run(() => super.openActiveResultInBrowser());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
query: ${query},
results: ${results},
activeResultUrl: ${activeResultUrl}
    ''';
  }
}
