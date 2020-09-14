import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/provider.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderShimmer extends HookWidget {
  final double height;
  final double width;
  final Function(double) computeWidth;
  final Function(double) computeHeight;
  final Color backgroundColor;
  final Color shineColor;
  final bool isAnimated;
  final bool align;

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

  Widget _wrapper(Widget Function(double, double) builder) {
    var child;
    if (width > 0 && height > 0) {
      child = builder(width, height);
    } else {
      child = LayoutBuilder(builder: (context, constraints) {
        return builder(
          width > 0 ? width : computeWidth(constraints.maxWidth),
          height > 0 ? height : computeHeight(constraints.maxHeight),
        );
      });
    }

    if (align) {
      return Align(
        alignment: Alignment.topLeft,
        child: Container(child: child),
      );
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    final _track = useTrackStore();

    return O(() {
      final bg = _track.artwork.placeholderBgColor;
      final fg = _track.artwork.placeholderFgColor;

      return _wrapper(
        (width, height) => Shimmer.fromColors(
          baseColor: bg,
          highlightColor: fg,
          enabled: isAnimated,
          child: AnimatedContainer(
            width: width,
            height: height,
            duration: UX.transitionDuration,
            decoration: BoxDecoration(
              color: fg,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      );
    });
  }
}
