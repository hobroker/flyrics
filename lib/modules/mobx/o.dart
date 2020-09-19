import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flyrics/utils/async_data.dart';
import 'package:flyrics/views/empty_widget.dart';

typedef WidgetFn = Widget Function();
typedef Predicate = bool Function();
typedef DataStatusPredicate = DataStatus Function();

class O extends Observer {
  O([WidgetFn builder]) : super(builder: (_) => builder());

  factory O.branch(Predicate predicate, WidgetFn truthy, WidgetFn falsy) =>
      O(() => predicate() ? truthy() : falsy());

  factory O.when(Predicate predicate, WidgetFn truthy) =>
      O(() => predicate() ? truthy() : EmptyWidget());

  factory O.unless(Predicate predicate, WidgetFn falsy) =>
      O(() => !predicate() ? falsy() : EmptyWidget());

  factory O.statusBranch(
    DataStatusPredicate getStatus, {
    @required WidgetFn placeholder,
    @required WidgetFn loading,
    @required WidgetFn success,
    @required WidgetFn error,
    @required WidgetFn empty,
  }) =>
      O(() {
        switch (getStatus()) {
          case DataStatus.success:
            return success();
          case DataStatus.error:
            return error();
          case DataStatus.empty:
            return empty();
          case DataStatus.loading:
            return loading();
          default:
            return placeholder();
        }
      });
}
