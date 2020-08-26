import 'package:flutter/foundation.dart';

@immutable
class TimerState {
  final bool refreshTrack;
  final bool checkIsRunning;

  const TimerState({
    this.refreshTrack,
    this.checkIsRunning,
  });

  factory TimerState.init() {
    return TimerState(
      refreshTrack: false,
      checkIsRunning: false,
    );
  }

  TimerState copyWith({refreshTrack, checkIsRunning}) {
    return TimerState(
      refreshTrack: refreshTrack ?? this.refreshTrack,
      checkIsRunning: checkIsRunning ?? this.checkIsRunning,
    );
  }

  @override
  bool operator ==(other) {
    return other is TimerState &&
        other.refreshTrack == refreshTrack &&
        other.checkIsRunning == checkIsRunning;
  }

  @override
  int get hashCode => super.hashCode;
}
