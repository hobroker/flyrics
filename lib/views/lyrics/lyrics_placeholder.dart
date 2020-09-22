import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/hooks/media.dart';
import 'package:flyrics/utils/list.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class LyricsPlaceholder extends HookWidget {
  final int _linesCount = 14;
  final double _height = 12;
  final bool animated;

  LyricsPlaceholder({
    this.animated = false,
  });

  Widget get _line => PlaceholderShimmer.fractionalWidth(
        [0.6, 0.8],
        height: _height,
        animated: animated,
      );

  Widget get _spacer => SizedBox(height: _height);

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
          (idx) => Container(
            margin: EdgeInsets.only(bottom: ux.spacingUnit),
            child: _isEmpty(idx) ? _spacer : _line,
          ),
        ),
      ),
    );
  }
}
