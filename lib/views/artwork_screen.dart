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

    return Container(
      width: height,
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
            width: height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [fadeColor, Colors.transparent],
                tileMode: TileMode.repeated,
              ),
            ),
            duration: Duration(milliseconds: 300),
          ),
          Positioned(
            top: height / 2,
            child: AnimatedContainer(
              width: height,
              height: height / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [fadeColor, Colors.transparent],
                  tileMode: TileMode.repeated,
                ),
              ),
              duration: Duration(milliseconds: 300),
            ),
          )
        ],
      ),
    );
  }
}
