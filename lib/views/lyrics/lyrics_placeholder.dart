import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/media.dart';
import 'package:flyrics/hooks/injection.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class LyricsPlaceholder extends HookWidget {
  final double height = 12;
  final int linesCount = 14;

  double genWidth(appWidth) => appWidth * randomBetween(0.6, 0.8);

  Widget Function(double, int) _buildLine(bool isLoading) => (item, index) {
        return index % 5 == 0
            ? SizedBox(height: height)
            : Container(
                margin: EdgeInsets.only(bottom: I<UX>().spacingUnit),
                child: PlaceholderShimmer(
                  height: height,
                  isAnimated: isLoading,
                  width: item,
                ),
              );
      };

  @override
  Widget build(BuildContext context) {
    final _track = useTrackStore();
    final appWidth = useMediaSize().width;
    final list = List.generate(linesCount, (idx) => genWidth(appWidth))
        .toList(growable: false);

    return O(
      () {
        final _lineBuilder = _buildLine(_track.lyrics.isLoading);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: mapList<Widget>(list, _lineBuilder),
        );
      },
    );
  }
}

List mapList<T>(List list, Widget Function(double, int) builder) {
  var idx = 0;

  return list.map((item) => builder(item, idx++)).toList(growable: false);
}
