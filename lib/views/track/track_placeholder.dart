import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/hooks/store.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class TrackPlaceholder extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isAnimated = useSelector(isTrackLoading);

    return LayoutBuilder(builder: (context, constraints) {
      var appWidth = constraints.maxWidth;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlaceholderShimmer(
            height: 16.0,
            isAnimated: isAnimated,
            width: appWidth * randomBetween(0.7, 0.9),
          ),
          SizedBox(height: UX.spacingUnit),
          PlaceholderShimmer(
            height: 15,
            isAnimated: isAnimated,
            width: appWidth * randomBetween(0.5, 0.6),
          ),
        ],
      );
    });
  }
}
