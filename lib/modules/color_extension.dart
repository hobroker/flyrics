import 'package:flutter/material.dart';

extension ColorLuminanceExtension on Color {
  Color _darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color _lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  Color get opposite {
    var luminance = computeLuminance();

    if (luminance < 0.5) {
      return _lighten(0.75);
    }

    var amount = luminance > 0.75 ? luminance : 0.5;

    return _darken(amount);
  }

  Color get autoDarkened {
    var luminance = computeLuminance();
    if (luminance > 0.6) {
      return _darken(0.35);
    }
    if (luminance > 0.3) {
      return _darken(0.2);
    }

    return this;
  }
}
