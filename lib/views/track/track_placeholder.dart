import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class TrackPlaceholder extends StatelessWidget {
  final _track = I<TrackStore>();

  @override
  Widget build(BuildContext context) {
    return O(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlaceholderShimmer(
            align: true,
            height: 16.0,
            isAnimated: _track.isLoading,
            computeWidth: (max) => max * randomBetween(0.7, 0.9),
          ),
          SizedBox(height: UX.spacingUnit),
          PlaceholderShimmer(
            align: true,
            height: 15,
            isAnimated: _track.isLoading,
            computeWidth: (max) => max * randomBetween(0.5, 0.6),
          ),
        ],
      ),
    );
  }
}
