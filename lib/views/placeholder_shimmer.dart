import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderShimmer extends HookWidget {
  final double height;
  final double width;
  final double widthRatio;
  final double heightRatio;
  final Color backgroundColor;
  final Color shineColor;
  final bool isAnimated;
  final bool align;

  PlaceholderShimmer({
    Key key,
    this.height = 0,
    this.width = 0,
    this.widthRatio = 1,
    this.heightRatio = 1,
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
          width > 0 ? width : constraints.maxWidth * widthRatio,
          height > 0 ? height : constraints.maxHeight * widthRatio,
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
    final _color = useColorStore();
    final ux = useUX();

    return O(() {
      final bg = _color.placeholderBgColor;
      final fg = _color.placeholderFgColor;

      return _wrapper(
        (width, height) => Shimmer.fromColors(
          baseColor: bg,
          highlightColor: fg,
          enabled: isAnimated,
          child: AnimatedContainer(
            width: width,
            height: height,
            duration: ux.transitionDuration,
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
