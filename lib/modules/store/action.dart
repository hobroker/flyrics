import 'package:flutter/cupertino.dart';

@immutable
mixin ReduxAction {
  @override
  String toString() => '${runtimeType}${_joinArgs()}';

  List<dynamic> get args => [];

  String _joinArgs() => args.isEmpty ? '{}' : '{ ${args.join(', ')} }';
}
