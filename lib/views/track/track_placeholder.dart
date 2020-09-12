import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/utils/o.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class TrackPlaceholder extends StatelessWidget {
  final _track = I<TrackStore>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var appWidth = constraints.maxWidth;

      return O(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceholderShimmer(
              height: 16.0,
              isAnimated: _track.isLoading,
              width: appWidth * randomBetween(0.7, 0.9),
            ),
            SizedBox(height: UX.spacingUnit),
            PlaceholderShimmer(
              height: 15,
              isAnimated: _track.isLoading,
              width: appWidth * randomBetween(0.5, 0.6),
            ),
          ],
        ),
      );
    });
  }
}
