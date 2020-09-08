import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/store.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class ArtworkPlaceholder extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isAnimated = useSelector(isArtworkLoading);

    return LayoutBuilder(
      builder: (context, constraints) {
        var height = constraints.maxHeight;
        var size = height * randomBetween(0.7, 0.85);
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
