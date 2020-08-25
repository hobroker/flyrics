import 'package:flutter/foundation.dart';
import 'package:flyrics/models/lyrics_part.dart';

@immutable
class LyricsResult {
  final String text;
  final int tries;
  final List<LyricsPart> parts;

  LyricsResult({
    this.text,
    this.tries,
    this.parts,
  });

  @override
  bool operator ==(other) {
    return other is LyricsResult &&
        other.text == text &&
        other.tries == tries &&
        other.parts == parts;
  }

  @override
  int get hashCode => super.hashCode;
}
