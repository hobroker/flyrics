import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

typedef WidgetFn = Widget Function();
typedef BoolFn = bool Function();

class O extends StatelessWidget {
  final WidgetFn builder;

  const O(this.builder, {Key key}) : super(key: key);

  factory O.branch(
    BoolFn predicate,
    WidgetFn truthy,
    WidgetFn falsy,
  ) =>
      O(() => predicate() ? truthy() : falsy());

  @override
  Widget build(BuildContext context) => Observer(builder: (_) => builder());
}
