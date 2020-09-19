import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class TrackPlaceholder extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ux = useUX();
    final _track = useTrackStore();

    return O(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlaceholderShimmer(
            height: 15.0,
            isAnimated: _track.isLoading,
            widthRatio: randomBetween(0.7, 0.9),
          ),
          SizedBox(height: ux.spacingUnit),
          PlaceholderShimmer(
            height: 14,
            isAnimated: _track.isLoading,
            widthRatio: randomBetween(0.5, 0.6),
          ),
        ],
      ),
    );
  }
}
