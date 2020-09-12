import 'package:flutter/widgets.dart';

List mapList<T>(List list, Widget Function(dynamic, int) builder) {
  var idx = 0;

  return list.map((item) => builder(item, idx++)).toList(growable: false);
}
