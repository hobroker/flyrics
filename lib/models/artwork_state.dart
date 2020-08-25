import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

@immutable
class ArtworkState {
  final String url;
  final List<int> bytes;
  final bool shouldRefresh;
  final List<Color> colors;
  final Color textColor;

  const ArtworkState({
    this.url,
    this.bytes,
    this.shouldRefresh = true,
    this.colors = const [UI.primaryColor],
    this.textColor = UI.textColor,
  });

  Color get dominantColor => colors.first;

  ArtworkState rebuild(Function fn) {
    return fn(this);
  }

  ArtworkState copyWith({
    url,
    bytes,
    shouldRefresh,
    textColor,
    colors,
  }) {
    return ArtworkState(
      url: url ?? this.url,
      bytes: bytes ?? this.bytes,
      shouldRefresh: shouldRefresh ?? this.shouldRefresh,
      textColor: textColor ?? this.textColor,
      colors: colors ?? this.colors,
    );
  }

  @override
  bool operator ==(other) {
    return other.url == url &&
        other.bytes == bytes &&
        other.shouldRefresh == shouldRefresh &&
        other.colors == colors &&
        other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}
