// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on ThemeStoreBase, Store {
  final _$themeAtom = Atom(name: 'ThemeStoreBase.theme');

  @override
  ThemeData get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeData value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  final _$ThemeStoreBaseActionController =
      ActionController(name: 'ThemeStoreBase');

  @override
  void setColors(List<Color> colors) {
    final _$actionInfo = _$ThemeStoreBaseActionController.startAction(
        name: 'ThemeStoreBase.setColors');
    try {
      return super.setColors(colors);
    } finally {
      _$ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
theme: ${theme}
    ''';
  }
}
