import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flyrics/constants/ux.dart';

class ArtworkGradient extends StatelessWidget {
  final Color color;

  ArtworkGradient({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final shadeWidth = height * .75;

        return Container(
          width: shadeWidth,
          child: AnimatedContainer(
            duration: UX.transitionDuration,
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
      },
    );
  }
}
