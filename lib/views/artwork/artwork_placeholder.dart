import 'package:flutter/material.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class ArtworkPlaceholder extends StatelessWidget {
  final bool isAnimated;

  const ArtworkPlaceholder({
    Key key,
    this.isAnimated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var height = constraints.maxHeight;
        var size = height * randomDoubleBetween(0.7, 0.85);
        var margin = (height - size) / 2;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          child: PlaceholderShimmer(
            height: size,
            width: size,
            isAnimated: isAnimated,
          ),
        );
      },
    );
  }
}
