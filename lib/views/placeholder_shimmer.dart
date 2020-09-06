import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/placeholder.dart';
import 'package:flyrics/utils/ux.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderShimmer extends HookWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color shineColor;
  final bool isAnimated;

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
    final backgroundColor =
        useSelector<AppState, Color>(resolvePlaceholderBgColor);
    final shineColor = useSelector<AppState, Color>(resolvePlaceholderFgColor);

    return Shimmer.fromColors(
      baseColor: backgroundColor,
      highlightColor: shineColor,
      enabled: isAnimated,
      child: AnimatedContainer(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: shineColor,
          borderRadius: BorderRadius.circular(2),
        ),
        duration: UX.transitionDuration,
      ),
    );
  }
}
