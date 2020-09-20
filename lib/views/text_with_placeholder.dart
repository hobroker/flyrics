import 'package:flutter/material.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:flyrics/views/marquee_text.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class PlaceholderMarqueeText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double placeholderWidthRatio;
  final bool isLoading;

  const PlaceholderMarqueeText({
    Key key,
    @required this.text,
    this.style,
    this.isLoading = false,
    this.placeholderWidthRatio = 1.0,
  }) : super(key: key);

  double get placeholderHeight => isNotNull(style) ? style.fontSize : 12.0;

  @override
  Widget build(BuildContext context) {
    if (isNotNull(text)) {
      return MarqueeText(
        text: text,
        style: style,
      );
    }

    return PlaceholderShimmer(
      height: placeholderHeight,
      isAnimated: isLoading,
      widthRatio: placeholderWidthRatio,
    );
  }
}
