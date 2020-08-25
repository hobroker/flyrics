import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class HeaderWrapper extends StatelessWidget {
  final List<Widget> children;

  HeaderWrapper({
    Key key,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UI(context).headerWidth,
      height: UI(context).headerHeight,
      child: Container(
        child: Row(
          children: children,
        ),
      ),
    );
  }
}
