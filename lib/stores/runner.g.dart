// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runner.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RunnerStore on RunnerStoreBase, Store {
  Computed<Track> _$trackComputed;

  @override
  Track get track => (_$trackComputed ??=
          Computed<Track>(() => super.track, name: 'RunnerStoreBase.track'))
      .value;

  final _$isWorkingAtom = Atom(name: 'RunnerStoreBase.isWorking');

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

  final _$refreshFlowAsyncAction = AsyncAction('RunnerStoreBase.refreshFlow');

  @override
  Future<dynamic> refreshFlow() {
    return _$refreshFlowAsyncAction.run(() => super.refreshFlow());
  }

  final _$refreshFlowAsyncAction = AsyncAction('RunnerStoreBase.refreshFlow');

  @override
  Future<dynamic> refreshFlow() {
    return _$refreshFlowAsyncAction.run(() => super.refreshFlow());
  }

  @override
  String toString() {
    return '''
isWorking: ${isWorking},
track: ${track}
    ''';
  }
}
