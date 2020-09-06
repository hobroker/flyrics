import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flyrics/models/track_model.dart';
import 'package:flyrics/utils/debug.dart';

@immutable
class TrackState {
  final HashMap<String, TrackModel> byId;
  final String activeId;
  final String lastActiveId;
  final bool isLoading;

  const TrackState({
    this.byId,
    this.activeId,
    this.lastActiveId,
    this.isLoading,
  });

  factory TrackState.init() {
    return TrackState(
      byId: HashMap<String, TrackModel>(),
      activeId: null,
      lastActiveId: null,
      isLoading: false,
    );
  }

  TrackState copyWith({byId, isLoading, activeId, lastActiveId}) {
    return TrackState(
      byId: byId ?? this.byId,
      activeId: activeId ?? this.activeId,
      lastActiveId: lastActiveId ?? this.lastActiveId,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return stringify({
      'byId': byId,
      'activeId': activeId,
      'lastActiveId': lastActiveId,
      'isLoading': isLoading,
    }, true);
  }

  @override
  bool operator ==(other) {
    return other is TrackState &&
        other.byId == byId &&
        other.activeId == activeId &&
        other.lastActiveId == lastActiveId &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => super.hashCode;
}
