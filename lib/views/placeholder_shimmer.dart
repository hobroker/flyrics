import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderShimmer extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color shineColor;
  final bool isAnimated;

  final _track = I<TrackStore>();

  PlaceholderShimmer({
    Key key,
    @required this.height,
    @required this.width,
    this.backgroundColor,
    this.shineColor,
    this.isAnimated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return O(
      () => Shimmer.fromColors(
        baseColor: _track.artwork.placeholderBgColor,
        highlightColor: _track.artwork.placeholderFgColor,
        enabled: isAnimated,
        child: AnimatedContainer(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: _track.artwork.placeholderFgColor,
            borderRadius: BorderRadius.circular(2),
          ),
          duration: UX.transitionDuration,
        ),
      ),
    );
  }
}
