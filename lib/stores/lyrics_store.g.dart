// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LyricsStore on LyricsStoreBase, Store {
  final _$isLoadingAtom = Atom(name: 'LyricsStoreBase.isLoading');

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

  final _$fetchGeniusLyricsAsyncAction =
      AsyncAction('LyricsStoreBase.fetchGeniusLyrics');

  @override
  Future<dynamic> fetchGeniusLyrics(String url) {
    return _$fetchGeniusLyricsAsyncAction
        .run(() => super.fetchGeniusLyrics(url));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
text: ${text}
    ''';
  }
}
