// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TestStore on TestStoreBase, Store {
  final _$count1Atom = Atom(name: 'TestStoreBase.count1');

  @override
  int get count1 {
    _$count1Atom.reportRead();
    return super.count1;
  }

  @override
  set count1(int value) {
    _$count1Atom.reportWrite(value, super.count1, () {
      super.count1 = value;
    });
  }

  final _$count2Atom = Atom(name: 'TestStoreBase.count2');

  @override
  int get count2 {
    _$count2Atom.reportRead();
    return super.count2;
  }

  @override
  set count2(int value) {
    _$count2Atom.reportWrite(value, super.count2, () {
      super.count2 = value;
    });
  }

  final _$TestStoreBaseActionController =
      ActionController(name: 'TestStoreBase');

  @override
  void increment1() {
    final _$actionInfo = _$TestStoreBaseActionController.startAction(
        name: 'TestStoreBase.increment1');
    try {
      return super.increment1();
    } finally {
      _$TestStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment2() {
    final _$actionInfo = _$TestStoreBaseActionController.startAction(
        name: 'TestStoreBase.increment2');
    try {
      return super.increment2();
    } finally {
      _$TestStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count1: ${count1},
count2: ${count2}
    ''';
  }
}
