import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/lyrics.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class LyricsPlaceholder extends HookWidget {
  final double height = 12;
  final int linesCount = 14;

  double genWidth(appWidth) => appWidth * randomBetween(0.6, 0.8);

  @override
  Widget build(BuildContext context) {
    final isAnimated = useSelector<AppState, bool>(areLyricsLoading);
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
            child: PlaceholderShimmer(
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
