import 'package:flutter/material.dart';
import 'package:flyrics/constants/sizing.dart';
import 'package:flyrics/utils/random.dart';

class PlaceholderLine extends StatefulWidget {
  final double height;
  final double maxWidth;

  PlaceholderLine({
    Key key,
    @required this.height,
    @required this.maxWidth,
  }) : super(key: key);

  @override
  _PlaceholderLineState createState() => _PlaceholderLineState();
}

class _PlaceholderLineState extends State<PlaceholderLine> {
  double getWidth() {
    var sub = widget.maxWidth * 0.1;

    return random((widget.maxWidth - sub).toInt(), widget.maxWidth.toInt())
        .toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Theme.of(context).primaryColor,
      duration: Duration(milliseconds: 300),
      width: this.getWidth(),
      height: widget.height,
    );
  }
}
