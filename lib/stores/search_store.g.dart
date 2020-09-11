// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

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
  BuiltList<SearchResult> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(BuiltList<SearchResult> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$searchCurrentQueryAsyncAction =
      AsyncAction('SearchStoreBase.searchCurrentQuery');

  @override
  Future<dynamic> searchCurrentQuery() {
    return _$searchCurrentQueryAsyncAction
        .run(() => super.searchCurrentQuery());
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
