import 'package:flutter/foundation.dart';

@immutable
class TimerState {
  final bool refreshTrack;

  const TimerState({
    this.refreshTrack,
  });

  TimerState copyWith({refreshTrack}) {
    return TimerState(
      refreshTrack: refreshTrack ?? this.refreshTrack,
    );
  }

  @override
  bool operator ==(other) {
    return other is TimerState && other.refreshTrack == refreshTrack;
  }

  @override
  int get hashCode => super.hashCode;
}
