import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderShimmer extends StatelessWidget {
  final double height;
  final double width;
  final Function(double) computeWidth;
  final Function(double) computeHeight;
  final Color backgroundColor;
  final Color shineColor;
  final bool isAnimated;
  final bool align;

  final _track = I<TrackStore>();

  PlaceholderShimmer({
    Key key,
    this.height = 0,
    this.width = 0,
    this.computeWidth,
    this.computeHeight,
    this.backgroundColor,
    this.shineColor,
    this.align = false,
    this.isAnimated = true,
  }) : super(key: key);

  Widget _wrap(Widget child) {
    if (align) {
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          child: child,
        ),
      );
    }

    return child;
  }

  Widget _buildPlaceholder(double width, double height) {
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

  dynamic _build() {
    if (width != null && height != null) {
      return _buildPlaceholder(width, height);
    }

    return LayoutBuilder(builder: (context, constraints) {
      if (width == null) {
        return _buildPlaceholder(
          computeWidth(constraints.maxWidth),
          height,
        );
      }

      return _buildPlaceholder(
        width,
        computeHeight(constraints.maxHeight),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _wrap(_build());
  }
}
