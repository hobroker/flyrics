import 'package:flutter/material.dart';
import 'package:flyrics/containers/placeholder_container.dart';
import 'package:flyrics/utils/random.dart';

class ArtworkPlaceholder extends StatelessWidget {
  final bool isAnimated;
  final double height;

  const ArtworkPlaceholder({
    Key key,
    @required this.height,
    this.isAnimated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = height * randomDoubleBetween(0.7, 0.85);

    return Container(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: PlaceholderContainer(
        height: size,
        width: size,
        isAnimated: isAnimated,
      ),
    );
  }
}
