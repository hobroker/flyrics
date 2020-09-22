import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';

class ArtworkGradient extends HookWidget {
  final Color color;

  const ArtworkGradient({Key key, this.color}) : super(key: key);

  Widget _buildGradient({
    double height,
    double width,
    Duration duration,
    Alignment begin,
    Alignment end,
  }) {
    return Container(
      height: height,
      width: width,
      child: AnimatedContainer(
        duration: duration,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            tileMode: TileMode.repeated,
            colors: [
              color.withOpacity(.9),
              color.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxHeight;
      final size = maxSize * .075;

      return Stack(
        children: [
          _buildGradient(
            height: maxSize,
            width: size,
            duration: ux.transitionDuration,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildGradient(
              height: size,
              width: maxSize,
              duration: ux.transitionDuration,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          )
        ],
      );
    });
  }
}
