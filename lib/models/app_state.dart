import 'package:flutter/foundation.dart';
import 'package:flyrics/models/artwork_state.dart';
import 'package:flyrics/models/lyrics_state.dart';
import 'package:flyrics/models/search_state.dart';
import 'package:flyrics/models/track.dart';

@immutable
class AppState {
  final bool isRunning;
  final Track track;
  final ArtworkState artwork;
  final SearchState search;
  final LyricsState lyrics;

  AppState({
    this.isRunning: false,
    this.track: const Track(),
    this.artwork: const ArtworkState(),
    this.search: const SearchState(),
    this.lyrics: const LyricsState(),
  });

  bool operator ==(other) {
    return other is AppState &&
        other.isRunning == isRunning &&
        other.track == track &&
        other.lyrics == lyrics &&
        other.search == search &&
        other.artwork == artwork;
  }

  @override
  int get hashCode => super.hashCode;
}
