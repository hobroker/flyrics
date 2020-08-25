import 'package:flutter/material.dart';
import 'package:flyrics/utils/ux.dart';

class ArtworkScreen extends StatelessWidget {
  final List<int> bytes;
  final Color fadeColor;

  ArtworkScreen({
    Key key,
    @required this.bytes,
    this.fadeColor = UX.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var height = constraints.maxHeight;
        var shadeWidth = height * .75;

        return Container(
          child: Stack(
            children: [
              Container(
                width: height,
                height: height,
                child: Image.memory(
                  bytes,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
