// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork.dart';

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

  final _$errorAtom = Atom(name: 'ArtworkStoreBase.error');

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

  final _$fetchBytesAsyncAction = AsyncAction('ArtworkStoreBase.fetchBytes');

  @override
  Future<dynamic> fetchBytes(String url) {
    return _$fetchBytesAsyncAction.run(() => super.fetchBytes(url));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
bytes: ${bytes},
hasBytes: ${hasBytes}
    ''';
  }
}
