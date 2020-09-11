// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArtworkStore on ArtworkStoreBase, Store {
  Computed<bool> _$hasBytesComputed;

  @override
  bool get hasBytes =>
      (_$hasBytesComputed ??= Computed<bool>(() => super.hasBytes,
              name: 'ArtworkStoreBase.hasBytes'))
          .value;
  Computed<Color> _$dominantColorComputed;

  @override
  Color get dominantColor =>
      (_$dominantColorComputed ??= Computed<Color>(() => super.dominantColor,
              name: 'ArtworkStoreBase.dominantColor'))
          .value;
  Computed<Color> _$textColorComputed;

  @override
  Color get textColor =>
      (_$textColorComputed ??= Computed<Color>(() => super.textColor,
              name: 'ArtworkStoreBase.textColor'))
          .value;
  Computed<Color> _$placeholderBgColorComputed;

  @override
  Color get placeholderBgColor => (_$placeholderBgColorComputed ??=
          Computed<Color>(() => super.placeholderBgColor,
              name: 'ArtworkStoreBase.placeholderBgColor'))
      .value;
  Computed<Color> _$placeholderFgColorComputed;

  @override
  Color get placeholderFgColor => (_$placeholderFgColorComputed ??=
          Computed<Color>(() => super.placeholderFgColor,
              name: 'ArtworkStoreBase.placeholderFgColor'))
      .value;

  final _$isLoadingAtom = Atom(name: 'ArtworkStoreBase.isLoading');

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

  final _$bytesAtom = Atom(name: 'ArtworkStoreBase.bytes');

  @override
  List<int> get bytes {
    _$bytesAtom.reportRead();
    return super.bytes;
  }

  @override
  set bytes(List<int> value) {
    _$bytesAtom.reportWrite(value, super.bytes, () {
      super.bytes = value;
    });
  }

  final _$colorsAtom = Atom(name: 'ArtworkStoreBase.colors');

  @override
  List<Color> get colors {
    _$colorsAtom.reportRead();
    return super.colors;
  }

  @override
  set colors(List<Color> value) {
    _$colorsAtom.reportWrite(value, super.colors, () {
      super.colors = value;
    });
  }

  final _$fetchBytesAsyncAction = AsyncAction('ArtworkStoreBase.fetchBytes');

  @override
  Future<dynamic> fetchBytes(String url) {
    return _$fetchBytesAsyncAction.run(() => super.fetchBytes(url));
  }

  final _$fetchColorsAsyncAction = AsyncAction('ArtworkStoreBase.fetchColors');

  @override
  Future<dynamic> fetchColors() {
    return _$fetchColorsAsyncAction.run(() => super.fetchColors());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
bytes: ${bytes},
colors: ${colors},
hasBytes: ${hasBytes},
dominantColor: ${dominantColor},
textColor: ${textColor},
placeholderBgColor: ${placeholderBgColor},
placeholderFgColor: ${placeholderFgColor}
    ''';
  }
}
