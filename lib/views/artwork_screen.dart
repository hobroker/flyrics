import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class ArtworkScreen extends StatelessWidget {
  final List<int> bytes;
  final Color fadeColor;

  ArtworkScreen({
    Key key,
    @required this.bytes,
    this.fadeColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = UI(context).headerHeight;
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
          AnimatedContainer(
            width: shadeWidth,
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
            duration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
