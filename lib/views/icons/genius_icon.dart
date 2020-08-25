import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/views/icons/base_icon.dart';

class GeniusIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseIcon(
      color: UI.geniusAccentColor,
      name: UI.geniusIcon,
    );
  }
}
