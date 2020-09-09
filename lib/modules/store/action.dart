import 'package:flutter/cupertino.dart';

@immutable
mixin ReduxAction {
  @override
  String toString() => '${runtimeType}${_joinArgs()}';

  List<dynamic> get args => [];

  String _joinArgs() => args.isEmpty ? '{}' : '{ ${args.join(', ')} }';
}

abstract class SingleParameterAction<T> with ReduxAction {
  final T payload;

  SingleParameterAction(this.payload);

  @override
  List get args => [payload];
}
