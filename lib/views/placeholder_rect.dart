import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class PlaceholderRect extends StatelessWidget {
  final double height;
  final double width;

  PlaceholderRect({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: UI.primaryDarkColor,
    );
  }
}
