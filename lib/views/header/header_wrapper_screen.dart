import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class HeaderWrapperScreen extends StatelessWidget {
  final List<Widget> children;
  final Color backgroundColor;

  HeaderWrapperScreen({
    Key key,
    this.children,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: UI(context).headerWidth,
      child: Container(
        child: Row(
          children: children,
        ),
      ),
    );
  }
}
