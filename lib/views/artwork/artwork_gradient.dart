import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flyrics/constants/ux.dart';

class ArtworkGradient extends StatelessWidget {
  final Color fadeColor;

  ArtworkGradient({
    Key key,
    this.fadeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var height = constraints.maxHeight;
        var shadeWidth = height * .75;

        return Container(
          width: shadeWidth,
          child: AnimatedContainer(
            duration: UX.transitionDuration,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  fadeColor.withOpacity(0.75),
                  Colors.transparent,
                ],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
        );
      },
    );
  }
}
