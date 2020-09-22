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

  Color _dynamicLuminance([double amount = .1]) {
    final luminance = computeLuminance();

    return luminance < .2 ? _lighten(amount) : _darken(amount);
  }

  Color get opposite {
    final luminance = computeLuminance();

    if (luminance < .5) {
      return _lighten(0.75);
    }

    final amount = luminance > .75 ? luminance : .5;

    return _darken(amount);
  }

  Color get autoDarkened {
    final luminance = computeLuminance();

    if (luminance > .6) {
      return _darken(0.35);
    }
    if (luminance > .3) {
      return _darken(0.2);
    }

    return this;
  }

  Color darkenRelativeTo(Color color) {
    final luminance = computeLuminance();
    final diff = (color.computeLuminance() - luminance).abs();

    if (diff < .15) {
      return _dynamicLuminance(diff);
    }

    return this;
  }
}
