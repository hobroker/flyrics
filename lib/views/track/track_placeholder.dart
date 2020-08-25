import 'package:flutter/material.dart';
import 'package:flyrics/containers/placeholder_container.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/utils/sizing.dart';

class TrackPlaceholder extends StatelessWidget {
  final bool isAnimated;

  const TrackPlaceholder({
    Key key,
    this.isAnimated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlaceholderContainer(
          height: 20.0,
          isAnimated: isAnimated,
          width: UI(context).appWidth * randomDoubleBetween(0.6, 0.7),
        ),
        Spacer(),
        PlaceholderContainer(
          height: 16,
          isAnimated: isAnimated,
          width: UI(context).appWidth * randomDoubleBetween(0.4, 0.5),
        ),
      ],
    );
  }
}
