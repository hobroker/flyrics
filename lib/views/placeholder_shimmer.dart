import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/utils/random.dart';
import 'package:shimmer/shimmer.dart';

typedef ComputeSize = Size Function(BoxConstraints constraints);

class PlaceholderShimmer extends HookWidget {
  final Size size;
  final bool animated;
  final ComputeSize compute;

  PlaceholderShimmer({
    Key key,
    this.size,
    this.compute,
    this.animated = true,
  }) : super(key: key);

  factory PlaceholderShimmer.square(
    double size, {
    bool animated = true,
  }) =>
      PlaceholderShimmer(
        animated: animated,
        size: Size(size, size),
      );

  factory PlaceholderShimmer.fractionalWidth(
    List<double> range, {
    double height,
    bool animated = true,
  }) =>
      PlaceholderShimmer(
        animated: animated,
        compute: (constraints) =>
            Size(constraints.maxWidth * randomInRange(range), height),
      );

  Widget _buildPlaceholder({
    Size size,
    Color background,
    Color foreground,
    Duration transition,
  }) {
    return Shimmer.fromColors(
      baseColor: background,
      highlightColor: foreground,
      enabled: animated,
      child: AnimatedContainer(
        width: size.width,
        height: size.height,
        duration: transition,
        decoration: BoxDecoration(
          color: foreground,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _withLayoutBuilder(Widget Function(Size) builder) => LayoutBuilder(
        builder: (context, constraints) => builder(compute(constraints)),
      );

  @override
  Widget build(BuildContext context) {
    final ux = useUX();
    final _build = (size) => _buildPlaceholder(
          size: size,
          background: ux.theme.primaryColorDark,
          foreground: ux.theme.primaryColor,
          transition: ux.transitionDuration,
        );

    return size != null ? _build(size) : _withLayoutBuilder(_build);
  }
}
