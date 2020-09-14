import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/provider.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class TrackPlaceholder extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _track = useTrackStore();

    return O(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlaceholderShimmer(
            height: 16.0,
            isAnimated: _track.isLoading,
            computeWidth: (max) => max * randomBetween(0.7, 0.9),
          ),
          SizedBox(height: UX.spacingUnit),
          PlaceholderShimmer(
            height: 15,
            isAnimated: _track.isLoading,
            computeWidth: (max) => max * randomBetween(0.5, 0.6),
          ),
        ],
      ),
    );
  }
}
