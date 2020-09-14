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

  final _$isWorkingAtom = Atom(name: 'PlayerStoreBase.isWorking');

  @override
  bool get isWorking {
    _$isWorkingAtom.reportRead();
    return super.isWorking;
  }

  @override
  set isWorking(bool value) {
    _$isWorkingAtom.reportWrite(value, super.isWorking, () {
      super.isWorking = value;
    });
  }

  final _$updateIsRunningAsyncAction =
      AsyncAction('PlayerStoreBase.updateIsRunning');

  @override
  Future<dynamic> updateIsRunning() {
    return _$updateIsRunningAsyncAction.run(() => super.updateIsRunning());
  }

  final _$refreshFlowAsyncAction = AsyncAction('PlayerStoreBase.refreshFlow');

  @override
  Future<dynamic> refreshFlow() {
    return _$refreshFlowAsyncAction.run(() => super.refreshFlow());
  }

  @override
  String toString() {
    return '''
isRunning: ${isRunning},
isWorking: ${isWorking}
    ''';
  }
}
