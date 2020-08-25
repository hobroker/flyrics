import 'package:flutter/foundation.dart';
import 'package:flyrics/models/track.dart';
import 'package:flyrics/utils/debug.dart';

@immutable
class TrackState {
  final Map<String, Track> byId;
  final bool isLoading;

  const TrackState({
    this.byId,
    this.isLoading,
  });

  @override
  String toString() {
    return stringify({
      'byId': byId,
      'isLoading': isLoading,
    }, true);
  }

  @override
  bool operator ==(other) {
    return other is TrackState &&
        other.byId == byId &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => super.hashCode;
}
