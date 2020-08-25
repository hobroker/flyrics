import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/utils/color.dart';
import 'package:flyrics/utils/sizing.dart';

@immutable
class ArtworkState {
  final String url;
  final List<int> bytes;
  final List<Color> colors;
  final Color textColor;
  final bool isLoading;

  const ArtworkState({
    this.url,
    this.bytes,
    this.isLoading = true,
    this.colors = const [UI.primaryColor],
    this.textColor = UI.textColor,
  });

  Color get dominantColor => autoDarken(colors.first);

  ArtworkState rebuild(Function fn) {
    return fn(this);
  }

  ArtworkState copyWith({
    url,
    bytes,
    textColor,
    colors,
    isLoading,
  }) {
    return ArtworkState(
      url: url ?? this.url,
      bytes: bytes ?? this.bytes,
      textColor: textColor ?? this.textColor,
      colors: colors ?? this.colors,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(other) {
    return other.url == url &&
        other.bytes == bytes &&
        other.colors == colors &&
        other.isLoading == isLoading &&
        other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}
