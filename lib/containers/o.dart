import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flyrics/views/empty_widget.dart';

typedef WidgetFn = Widget Function();
typedef Predicate = bool Function();

class O extends StatelessWidget {
  final WidgetFn builder;

  const O(this.builder, {Key key}) : super(key: key);

  factory O.branch(Predicate predicate, WidgetFn truthy, WidgetFn falsy) =>
      O(() => predicate() ? truthy() : falsy());

  factory O.when(Predicate predicate, WidgetFn truthy) =>
      O(() => predicate() ? truthy() : EmptyWidget());

  @override
  Widget build(BuildContext context) => Observer(builder: (_) => builder());
}
