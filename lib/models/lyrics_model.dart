import 'package:flutter/foundation.dart';

@immutable
class LyricsModel {
  final String text;
  final String url;

  const LyricsModel({
    this.text,
    this.url,
  });

  LyricsModel copyWith({text, url}) {
    return LyricsModel(
      text: text ?? this.text,
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(other) {
    return other is LyricsModel && other.text == text && other.url == url;
  }

  @override
  int get hashCode => super.hashCode;
}
