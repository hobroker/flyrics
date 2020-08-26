import 'package:flutter/material.dart';
import 'package:flyrics/containers/placeholder_container.dart';
import 'package:flyrics/utils/random.dart';

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
        var size = constraints.maxHeight * randomDoubleBetween(0.7, 0.85);

        return Container(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: PlaceholderContainer(
            height: size,
            width: size,
            isAnimated: isAnimated,
          ),
        );
      },
    );
  }
}
