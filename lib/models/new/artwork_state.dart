import 'package:flutter/foundation.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/utils/debug.dart';

@immutable
class ArtworkState {
  final Map<String, ArtworkModel> byId;
  final bool isLoading;

  const ArtworkState({
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
    return (other is ArtworkState &&
        other.byId == byId &&
        other.isLoading == isLoading);
  }

  @override
  int get hashCode => super.hashCode;
}
