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
    return Container(
      child: Stack(
        children: [
          Container(
            width: UI(context).headerHeight,
            height: UI(context).headerHeight,
            child: Image.memory(bytes),
          ),
          AnimatedContainer(
            width: UI(context).headerHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [fadeColor, Colors.transparent],
                tileMode: TileMode.repeated,
              ),
            ),
            duration: Duration(milliseconds: 300),
          )
        ],
      ),
    );
  }
}
