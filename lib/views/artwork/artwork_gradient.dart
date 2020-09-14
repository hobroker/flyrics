import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';

class ArtworkGradient extends HookWidget {
  final Color color;

  ArtworkGradient({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      final shadeWidth = height * .75;

      return Container(
        width: shadeWidth,
        child: AnimatedContainer(
          duration: ux.transitionDuration,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.repeated,
              colors: [
                color.withOpacity(0.75),
                Colors.transparent,
              ],
            ),
          ),
        ),
      );
    });
  }
}
