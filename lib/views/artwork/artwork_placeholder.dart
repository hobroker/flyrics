import 'package:flutter/material.dart';
import 'package:flyrics/containers/placeholder_container.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/utils/sizing.dart';

class ArtworkPlaceholder extends StatelessWidget {
  final bool isAnimated;

  const ArtworkPlaceholder({
    Key key,
    this.isAnimated = true,
  }) : super(key: key);

  double getSize(context) {
    return UI(context).headerHeight * randomDoubleBetween(0.7, 0.85);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: PlaceholderContainer(
        height: getSize(context),
        width: getSize(context),
        isAnimated: isAnimated,
      ),
    );
  }
}
