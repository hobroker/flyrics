import 'package:built_value/built_value.dart';

part 'timer_state.g.dart';

abstract class TimerState implements Built<TimerState, TimerStateBuilder> {
  bool get refreshTrack;

  bool get checkIsRunning;

  TimerState._();

  factory TimerState([void Function(TimerStateBuilder) updates]) = _$TimerState;

  static void _initializeBuilder(TimerStateBuilder builder) => builder
    ..checkIsRunning = false
    ..refreshTrack = false;
}
