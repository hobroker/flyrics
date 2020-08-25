import 'package:flutter/foundation.dart';

@immutable
class LyricsModel {
  final String text;

  const LyricsModel({
    this.text,
  });

  LyricsModel copyWith({text}) {
    return LyricsModel(
      text: text ?? this.text,
    );
  }

  @override
  bool operator ==(other) {
    return other is LyricsModel && other.text == text;
  }

  @override
  int get hashCode => super.hashCode;
}
