import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class LyricsPlaceholder extends StatelessWidget {
  final double height = 12;
  final int linesCount = 14;

  final _track = I<TrackStore>();

  double genWidth(appWidth) => appWidth * randomBetween(0.6, 0.8);

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        linesCount,
        (index) {
          if (index % 5 == 0) {
            return SizedBox(height: height);
          }

          return Container(
            margin: EdgeInsets.only(bottom: UX.spacingUnit),
            child: O(
              () => PlaceholderShimmer(
                height: height,
                isAnimated: _track.lyrics.isLoading,
                width: genWidth(appWidth),
              ),
            ),
          );
        },
      ),
    );
  }
}
