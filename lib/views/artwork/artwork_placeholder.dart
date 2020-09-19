import 'package:flutter/material.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class ArtworkPlaceholder extends StatelessWidget {
  final bool animated;

  ArtworkPlaceholder({
    this.animated = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      final size = height * 0.8;
      final margin = (height - size) / 2;

      return Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        child: PlaceholderShimmer(
          height: size,
          width: size,
          isAnimated: animated,
        ),
      );
    });
  }
}
