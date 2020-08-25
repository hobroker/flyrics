import 'package:flutter/foundation.dart';

@immutable
class LyricsResult {
  final String text;
  final int tries;

  LyricsResult({this.text, this.tries});

  @override
  bool operator ==(other) {
    return other is LyricsResult && other.text == text && other.tries == tries;
  }

  @override
  int get hashCode => super.hashCode;
}
