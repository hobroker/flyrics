import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/utils/debug.dart';

@immutable
class ArtworkState {
  final bool isLoading;
  final HashMap<String, ArtworkModel> byId;

  const ArtworkState({
    this.isLoading,
    this.byId,
  });

  factory ArtworkState.init() {
    return ArtworkState(
      isLoading: false,
      byId: HashMap<String, ArtworkModel>(),
    );
  }

  ArtworkState copyWith({byId, isLoading}) {
    return ArtworkState(
      byId: byId ?? this.byId,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return stringify({
      'byId': byId,
      'isLoading': isLoading,
    }, true);
  }

  @override
  bool operator ==(other) {
    return (other is ArtworkState &&
        other.byId == byId &&
        other.isLoading == isLoading);
  }

  @override
  int get hashCode => super.hashCode;
}
