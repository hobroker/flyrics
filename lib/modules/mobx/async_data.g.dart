// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'async_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AsyncDataStore<T> on AsyncDataStoreBase<T>, Store {
  Computed<bool> _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: 'AsyncDataStoreBase.hasData'))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'AsyncDataStoreBase.isLoading'))
          .value;
  Computed<bool> _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??= Computed<bool>(() => super.isEmpty,
          name: 'AsyncDataStoreBase.isEmpty'))
      .value;

  final _$statusAtom = Atom(name: 'AsyncDataStoreBase.status');

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

  final _$errorAtom = Atom(name: 'AsyncDataStoreBase.error');

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

  final _$dataAtom = Atom(name: 'AsyncDataStoreBase.data');

  @override
  T get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(T value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$waitAsyncAction = AsyncAction('AsyncDataStoreBase.wait');

  @override
  Future<dynamic> wait(Future<dynamic> future) {
    return _$waitAsyncAction.run(() => super.wait(future));
  }

  @override
  String toString() {
    return '''
status: ${status},
error: ${error},
data: ${data},
hasData: ${hasData},
isLoading: ${isLoading},
isEmpty: ${isEmpty}
    ''';
  }
}
