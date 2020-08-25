import 'package:flutter/material.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/views/empty_widget.dart';
import 'package:flyrics/views/placeholder_shimmer_screen.dart';

class LyricsPlaceholder extends StatelessWidget {
  final double height = 16;
  final bool isAnimated;

  const LyricsPlaceholder({
    Key key,
    this.isAnimated = true,
  }) : super(key: key);

  Widget getPlaceholderLine(context) {
    return PlaceholderShimmerScreeen(
      height: height,
      isAnimated: isAnimated,
      width: UI(context).appWidth * randomDoubleBetween(0.6, 0.8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        9,
        (index) {
          if (index == 4) {
            return Container(
              height: height,
              child: EmptyWidget(),
            );
          }

          return Container(
            margin: EdgeInsets.only(bottom: 4),
            child: getPlaceholderLine(context),
          );
        },
      ),
    );
  }
}
