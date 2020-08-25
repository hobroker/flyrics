import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class HeaderWrapper extends StatelessWidget {
  final List<Widget> children;
  final double height;

  HeaderWrapper({
    Key key,
    this.children,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UI(context).headerWidth,
      height: height,
      child: Container(
        child: Row(
          children: children,
        ),
      ),
    );
  }
}
