import 'package:flutter/foundation.dart';
import 'package:flyrics/models/lyrics_model.dart';

@immutable
class LyricsState {
  final bool isLoading;
  final Map<String, LyricsModel> byId;

  const LyricsState({
    this.isLoading,
    this.byId,
  });

  LyricsState copyWith({isLoading, byId}) {
    return LyricsState(
      isLoading: isLoading ?? this.isLoading,
      byId: byId ?? this.byId,
    );
  }

  @override
  bool operator ==(other) {
    return other is LyricsState &&
        other.isLoading == isLoading &&
        other.byId == byId;
  }

  @override
  int get hashCode => super.hashCode;
}
