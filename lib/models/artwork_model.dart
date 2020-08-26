import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flyrics/utils/ux.dart';

@immutable
class ArtworkModel {
  final String url;
  final List<int> bytes;
  final List<Color> colors;
  final Color textColor;
  final Color dominantColor;

  const ArtworkModel({
    this.url,
    this.bytes,
    this.colors = const [UX.primaryColor],
    this.textColor = UX.textColor,
    this.dominantColor = UX.primaryColor,
  });

//  Color get dominantColor => autoDarken(colors.first);

  ArtworkModel rebuild(Function fn) {
    return fn(this);
  }

  ArtworkModel copyWith({
    url,
    bytes,
    textColor,
    dominantColor,
    colors,
    isLoading,
  }) {
    return ArtworkModel(
      url: url ?? this.url,
      bytes: bytes ?? this.bytes,
      textColor: textColor ?? this.textColor,
      dominantColor: dominantColor ?? this.dominantColor,
      colors: colors ?? this.colors,
    );
  }

  @override
  bool operator ==(other) {
    return other is ArtworkModel &&
        other.url == url &&
        other.bytes == bytes &&
        other.colors == colors &&
        other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}
