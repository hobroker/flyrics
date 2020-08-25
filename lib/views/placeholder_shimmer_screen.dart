import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderShimmerScreeen extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color shineColor;
  final bool isAnimated;

  PlaceholderShimmerScreeen({
    Key key,
    @required this.height,
    @required this.width,
    this.backgroundColor,
    this.shineColor,
    this.isAnimated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: backgroundColor ?? UI.primaryDarkColor,
      highlightColor: shineColor ?? UI.primaryColor,
      enabled: isAnimated,
      child: AnimatedContainer(
        width: width,
        height: height,
        color: UI.primaryColor,
        duration: UI.transitionDuration,
      ),
    );
  }
}
