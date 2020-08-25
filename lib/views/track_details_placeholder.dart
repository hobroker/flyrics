import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/views/placeholder_rect.dart';

class TrackDetailsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlaceholderRect(
          height: 20.0,
          width: UI(context).appWidth * 0.7,
        ),
        Spacer(),
        PlaceholderRect(
          height: 16,
          width: UI(context).appWidth * 0.45,
        ),
      ],
    );
  }
}
