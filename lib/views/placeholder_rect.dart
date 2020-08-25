import 'package:flutter/material.dart';
import 'package:flyrics/constants/sizing.dart';
import 'package:flyrics/utils/random.dart';

class PlaceholderRect extends StatefulWidget {
  final double height;
  final double width;

  PlaceholderRect({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  @override
  _PlaceholderRectState createState() => _PlaceholderRectState();
}

class _PlaceholderRectState extends State<PlaceholderRect> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Theme.of(context).primaryColor,
      duration: Duration(milliseconds: 300),
      width: widget.width,
      height: widget.height,
    );
  }
}
