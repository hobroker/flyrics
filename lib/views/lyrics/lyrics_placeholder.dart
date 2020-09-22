import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/hooks/media.dart';
import 'package:flyrics/utils/list.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class LyricsPlaceholder extends HookWidget {
  final int _linesCount = 14;
  final double _lineHeight = 12;
  final bool animated;

  LyricsPlaceholder({
    this.animated = false,
  });

  bool _isEmpty(idx) => idx % 5 == 0;

  @override
  Widget build(BuildContext context) {
    final maxHeight = useMediaSize().height;
    final ux = useUX();

    return Container(
      height: maxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: generateListOf<Widget>(
          _linesCount,
          (idx) => _isEmpty(idx)
              ? SizedBox(height: _lineHeight)
              : PlaceholderShimmer.fractionalWidth(
                  [0.6, 0.8],
                  height: _lineHeight,
                  animated: animated,
                  padding: EdgeInsets.only(bottom: ux.spacingUnit),
                ),
        ),
      ),
    );
  }
}
