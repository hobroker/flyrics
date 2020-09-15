import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/hooks/media.dart';
import 'package:flyrics/utils/list.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class LyricsPlaceholder extends HookWidget {
  final int _linesCount = 14;

  @override
  Widget build(BuildContext context) {
    final ux = useUX();
    final _lyrics = useLyricsStore();
    final maxWidth = useMediaSize().width;

    return O(
      () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: generateListOf<_LyricsLine>(
            _linesCount,
            (idx) => _LyricsLine(
              index: idx,
              maxWidth: maxWidth,
              isAnimated: _lyrics.isLoading,
              bottomSpacing: ux.spacingUnit,
            ),
          ),
        );
      },
    );
  }
}

class _LyricsLine extends StatelessWidget {
  final int index;
  final double bottomSpacing;
  final bool isAnimated;
  final double maxWidth;
  final double _height = 12;

  const _LyricsLine({
    Key key,
    this.index,
    this.bottomSpacing,
    this.isAnimated,
    this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index % 5 == 0) {
      return SizedBox(height: _height);
    }

    return Container(
      margin: EdgeInsets.only(bottom: bottomSpacing),
      child: PlaceholderShimmer(
        height: _height,
        isAnimated: isAnimated,
        width: maxWidth * randomBetween(0.6, 0.8),
      ),
    );
  }
}
