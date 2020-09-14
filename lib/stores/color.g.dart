// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ColorStore on ColorStoreBase, Store {
  Computed<Color> _$dominantColorComputed;

  @override
  Color get dominantColor =>
      (_$dominantColorComputed ??= Computed<Color>(() => super.dominantColor,
              name: 'ColorStoreBase.dominantColor'))
          .value;
  Computed<Color> _$textColorComputed;

  @override
  Color get textColor =>
      (_$textColorComputed ??= Computed<Color>(() => super.textColor,
              name: 'ColorStoreBase.textColor'))
          .value;
  Computed<Color> _$placeholderBgColorComputed;

  @override
  Color get placeholderBgColor => (_$placeholderBgColorComputed ??=
          Computed<Color>(() => super.placeholderBgColor,
              name: 'ColorStoreBase.placeholderBgColor'))
      .value;
  Computed<Color> _$placeholderFgColorComputed;

  @override
  Color get placeholderFgColor => (_$placeholderFgColorComputed ??=
          Computed<Color>(() => super.placeholderFgColor,
              name: 'ColorStoreBase.placeholderFgColor'))
      .value;

  final _$errorAtom = Atom(name: 'ColorStoreBase.error');

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

  final _$colorsAtom = Atom(name: 'ColorStoreBase.colors');

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

  final _$fetchColorsAsyncAction = AsyncAction('ColorStoreBase.fetchColors');

  @override
  Future<dynamic> fetchColors(List<int> bytes) {
    return _$fetchColorsAsyncAction.run(() => super.fetchColors(bytes));
  }

  final _$ColorStoreBaseActionController =
      ActionController(name: 'ColorStoreBase');

  @override
  void resetColors() {
    final _$actionInfo = _$ColorStoreBaseActionController.startAction(
        name: 'ColorStoreBase.resetColors');
    try {
      return super.resetColors();
    } finally {
      _$ColorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
colors: ${colors},
dominantColor: ${dominantColor},
textColor: ${textColor},
placeholderBgColor: ${placeholderBgColor},
placeholderFgColor: ${placeholderFgColor}
    ''';
  }
}
