import 'package:flutter/material.dart';
import 'package:flyrics/containers/placeholder_shimmer.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/utils/sizing.dart';

class TrackDetailsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlaceholderShimmer(
          height: 20.0,
          width: UI(context).appWidth * randomDoubleBetween(0.6, 0.7),
        ),
        Spacer(),
        PlaceholderShimmer(
          height: 16,
          width: UI(context).appWidth * randomDoubleBetween(0.4, 0.5),
        ),
      ],
    );
  }
}
