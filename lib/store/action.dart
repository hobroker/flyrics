import 'package:flutter/cupertino.dart';

@immutable
mixin Action {
  @override
  String toString() => '${runtimeType}()';
}
