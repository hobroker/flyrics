import 'package:flutter/foundation.dart';
import 'package:flyrics/utils/debug.dart';

@immutable
class PlayerState {
  final bool isRunning;

  const PlayerState({
    this.isRunning,
  });

  PlayerState copyWith({isRunning}) {
    return PlayerState(
      isRunning: isRunning ?? this.isRunning,
    );
  }

  @override
  String toString() {
    return stringify({
      'isRunning': isRunning,
    }, true);
  }

  @override
  bool operator ==(other) {
    return (other is PlayerState && other.isRunning == isRunning);
  }

  @override
  int get hashCode => super.hashCode;
}
