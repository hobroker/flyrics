import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderShimmerScreeen extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color shineColor;

  PlaceholderShimmerScreeen({
    Key key,
    @required this.height,
    @required this.width,
    this.backgroundColor,
    this.shineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: backgroundColor ?? UI.primaryDarkColor,
      highlightColor: shineColor ?? UI.primaryColor,
      enabled: true,
      child: AnimatedContainer(
        width: width,
        height: height,
        color: UI.primaryColor,
        duration: UI.transitionDuration,
      ),
    );
  }
}
