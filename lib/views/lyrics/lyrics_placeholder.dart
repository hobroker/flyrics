import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/media.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/map_list.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class LyricsPlaceholder extends HookWidget {
  final double height = 12;
  final int linesCount = 14;

  final _track = I<TrackStore>();

  double genWidth(appWidth) => appWidth * randomBetween(0.6, 0.8);

  Widget _buildLine(item, index) {
    return index % 5 == 0
        ? SizedBox(height: height)
        : Container(
            margin: EdgeInsets.only(bottom: UX.spacingUnit),
            child: O(
              () => PlaceholderShimmer(
                height: height,
                isAnimated: _track.lyrics.isLoading,
                width: item,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final appWidth = useMediaSize().width;
    final list = List.generate(linesCount, (idx) => genWidth(appWidth))
        .toList(growable: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: mapList<Widget>(list, _buildLine),
    );
  }
}
