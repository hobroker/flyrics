import 'package:flutter/material.dart';
import 'package:flyrics/constants/sizing.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_rect.dart';

class TrackDetailsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlaceholderRect(
          height: 20.0,
          width: randomSize(Sizing(context).appWidth * 0.75),
        ),
        Spacer(),
        PlaceholderRect(
          height: 16,
          width: randomSize(Sizing(context).appWidth * 0.5),
        ),
      ],
    );
  }
}
