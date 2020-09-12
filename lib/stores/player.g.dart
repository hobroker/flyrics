// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerStore on PlayerStoreBase, Store {
  final _$isRunningAtom = Atom(name: 'PlayerStoreBase.isRunning');

  @override
  bool get isRunning {
    _$isRunningAtom.reportRead();
    return super.isRunning;
  }

  @override
  set isRunning(bool value) {
    _$isRunningAtom.reportWrite(value, super.isRunning, () {
      super.isRunning = value;
    });
  }

  final _$fetchIsRunningAsyncAction =
      AsyncAction('PlayerStoreBase.fetchIsRunning');

  @override
  Future<dynamic> fetchIsRunning() {
    return _$fetchIsRunningAsyncAction.run(() => super.fetchIsRunning());
  }

  final _$PlayerStoreBaseActionController =
      ActionController(name: 'PlayerStoreBase');

  @override
  void updateSearchQuery() {
    final _$actionInfo = _$PlayerStoreBaseActionController.startAction(
        name: 'PlayerStoreBase.updateSearchQuery');
    try {
      return super.updateSearchQuery();
    } finally {
      _$PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void triggerLyricsFetch() {
    final _$actionInfo = _$PlayerStoreBaseActionController.startAction(
        name: 'PlayerStoreBase.triggerLyricsFetch');
    try {
      return super.triggerLyricsFetch();
    } finally {
      _$PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRunning: ${isRunning}
    ''';
  }
}
