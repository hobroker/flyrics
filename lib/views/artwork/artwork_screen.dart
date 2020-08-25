import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class ArtworkScreen extends StatelessWidget {
  final List<int> bytes;
  final Color fadeColor;
  final double height;

  ArtworkScreen({
    Key key,
    @required this.bytes,
    @required this.height,
    this.fadeColor = UI.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              duration: UI.transitionDuration,
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
  }
}
