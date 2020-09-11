import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

typedef WidgetFn = Widget Function();
typedef BoolFn = bool Function();

class O extends StatelessWidget {
  final WidgetFn _builder;

  const O(this._builder, {Key key}) : super(key: key);

  factory O.branch(
    BoolFn condition,
    WidgetFn truthy,
    WidgetFn falsy,
  ) =>
      O(() => condition() ? truthy() : falsy());

  @override
  Widget build(BuildContext context) => Observer(builder: (_) => _builder());
}
