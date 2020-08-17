import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final int counter;

  AppState({this.counter});

  factory AppState.loading() => AppState(counter: 2);
}
