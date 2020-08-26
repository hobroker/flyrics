import 'package:flutter/material.dart';
import 'package:flyrics/containers/placeholder_container.dart';
import 'package:flyrics/utils/random.dart';

class LyricsPlaceholder extends StatelessWidget {
  final bool isAnimated;
  final double height = 12;
  final int linesCount = 14;

  const LyricsPlaceholder({
    Key key,
    this.isAnimated = true,
  }) : super(key: key);

  double genWidth(appWidth) => appWidth * randomDoubleBetween(0.6, 0.8);

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        linesCount,
        (index) {
          if (index % 5 == 0) {
            return SizedBox(height: height);
          }

          return Container(
            margin: EdgeInsets.only(bottom: 4),
            child: PlaceholderContainer(
              height: height,
              isAnimated: isAnimated,
              width: genWidth(appWidth),
            ),
          );
        },
      ),
    );
  }
}
