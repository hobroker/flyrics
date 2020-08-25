import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

@immutable
class ArtworkState {
  final String url;
  final List<int> bytes;
  final bool shouldRefresh;
  final Color dominantColor;
  final List<Color> colors;
  final Color textColor;

  const ArtworkState({
    this.url,
    this.bytes,
    this.shouldRefresh = true,
    this.dominantColor = UI.primaryColor,
    this.colors = const [],
    this.textColor = UI.textColor,
  });

  ArtworkState rebuild(Function fn) {
    return fn(this);
  }

  copyWith({
    url,
    bytes,
    shouldRefresh,
    dominantColor,
    textColor,
    colors,
  }) {
    return ArtworkState(
      url: url ?? this.url,
      bytes: bytes ?? this.bytes,
      shouldRefresh: shouldRefresh ?? this.shouldRefresh,
      dominantColor: dominantColor ?? this.dominantColor,
      textColor: textColor ?? this.textColor,
      colors: colors ?? this.colors,
    );
  }

  bool operator ==(other) {
    return other.url == url &&
        other.bytes == bytes &&
        other.shouldRefresh == shouldRefresh &&
        other.dominantColor == dominantColor &&
        other.colors == colors &&
        other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}
