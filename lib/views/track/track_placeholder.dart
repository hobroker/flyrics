import 'package:flutter/material.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/utils/ux.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class TrackPlaceholder extends StatelessWidget {
  final bool isAnimated;

  const TrackPlaceholder({
    Key key,
    this.isAnimated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var appWidth = constraints.maxWidth;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlaceholderShimmer(
            height: 16.0,
            isAnimated: isAnimated,
            width: appWidth * randomDoubleBetween(0.7, 0.9),
          ),
          SizedBox(height: UX.spacingUnit),
          PlaceholderShimmer(
            height: 15,
            isAnimated: isAnimated,
            width: appWidth * randomDoubleBetween(0.5, 0.6),
          ),
        ],
      );
    });
  }
}
