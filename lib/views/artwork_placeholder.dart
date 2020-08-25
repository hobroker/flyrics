import 'package:flutter/material.dart';
import 'package:flyrics/containers/placeholder_shimmer.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/utils/sizing.dart';

class ArtworkPlaceholder extends StatelessWidget {
  double getSize(context) {
    return UI(context).headerHeight * randomDoubleBetween(0.7, 0.85);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: PlaceholderShimmer(
        height: getSize(context),
        width: getSize(context),
      ),
    );
  }
}
