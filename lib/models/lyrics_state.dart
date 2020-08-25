import 'package:flutter/foundation.dart';

@immutable
class LyricsState {
  final bool isLoading;
  final String text;

  const LyricsState({
    this.isLoading: true,
    this.text,
  });

  copyWith({isLoading, text}) {
    return LyricsState(
      isLoading: isLoading ?? this.isLoading,
      text: text ?? this.text,
    );
  }

  bool operator ==(other) {
    return other is LyricsState &&
        other.isLoading == isLoading &&
        other.text == text;
  }

  @override
  int get hashCode => super.hashCode;
}
