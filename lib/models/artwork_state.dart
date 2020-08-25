import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

@immutable
class ArtworkState {
  final String url;
  final List<int> bytes;
  final bool shouldRefresh;
  final Color backgroundColor;
  final Color textColor;

  const ArtworkState({
    this.url,
    this.bytes,
    this.shouldRefresh = true,
    this.backgroundColor = UI.primaryColor,
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
  }) {
    return ArtworkState(
      url: url ?? this.url,
      bytes: bytes ?? this.bytes,
      shouldRefresh: shouldRefresh ?? this.shouldRefresh,
      backgroundColor: dominantColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }
}
