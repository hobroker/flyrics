// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LyricsStore on LyricsStoreBase, Store {
  Computed<SearchItem> _$selectedSearchItemComputed;

  @override
  SearchItem get selectedSearchItem => (_$selectedSearchItemComputed ??=
          Computed<SearchItem>(() => super.selectedSearchItem,
              name: 'LyricsStoreBase.selectedSearchItem'))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'LyricsStoreBase.isLoading'))
          .value;
  Computed<String> _$selectedSearchItemUrlComputed;

  @override
  String get selectedSearchItemUrl => (_$selectedSearchItemUrlComputed ??=
          Computed<String>(() => super.selectedSearchItemUrl,
              name: 'LyricsStoreBase.selectedSearchItemUrl'))
      .value;

  final _$textAtom = Atom(name: 'LyricsStoreBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$errorAtom = Atom(name: 'LyricsStoreBase.error');

  @override
  Object get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Object value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$statusAtom = Atom(name: 'LyricsStoreBase.status');

  @override
  DataStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(DataStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$selectedSearchIdxAtom =
      Atom(name: 'LyricsStoreBase.selectedSearchIdx');

  @override
  int get selectedSearchIdx {
    _$selectedSearchIdxAtom.reportRead();
    return super.selectedSearchIdx;
  }

  @override
  set selectedSearchIdx(int value) {
    _$selectedSearchIdxAtom.reportWrite(value, super.selectedSearchIdx, () {
      super.selectedSearchIdx = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('LyricsStoreBase.fetch');

  @override
  Future<dynamic> fetch(Track track) {
    return _$fetchAsyncAction.run(() => super.fetch(track));
  }

  final _$_fetchGeniusLyricsAsyncAction =
      AsyncAction('LyricsStoreBase._fetchGeniusLyrics');

  @override
  Future<dynamic> _fetchGeniusLyrics(String url) {
    return _$_fetchGeniusLyricsAsyncAction
        .run(() => super._fetchGeniusLyrics(url));
  }

  final _$openSelectedItemInBrowserAsyncAction =
      AsyncAction('LyricsStoreBase.openSelectedItemInBrowser');

  @override
  Future<dynamic> openSelectedItemInBrowser() {
    return _$openSelectedItemInBrowserAsyncAction
        .run(() => super.openSelectedItemInBrowser());
  }

  @override
  String toString() {
    return '''
text: ${text},
error: ${error},
status: ${status},
selectedSearchIdx: ${selectedSearchIdx},
selectedSearchItem: ${selectedSearchItem},
isLoading: ${isLoading},
selectedSearchItemUrl: ${selectedSearchItemUrl}
    ''';
  }
}
