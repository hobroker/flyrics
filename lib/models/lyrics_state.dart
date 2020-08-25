import 'package:flutter/foundation.dart';

@immutable
class LyricsState {
  final bool isLoading;
  final String text;

  LyricsState({this.isLoading, this.text});

  bool operator ==(other) {
    return other is LyricsState &&
        other.isLoading == isLoading &&
        other.text == text;
  }

  @override
  int get hashCode => super.hashCode;
}
