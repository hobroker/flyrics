import 'package:flutter/material.dart';
import 'package:flyrics/containers/dynamic_container.dart';
import 'package:flyrics/utils/sizing.dart';

class HeaderWrapperScreen extends StatelessWidget {
  final Color backgroundColor;
  final List<Widget> children;

  HeaderWrapperScreen({
    Key key,
    this.backgroundColor,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UI(context).headerWidth,
      height: UI(context).headerHeight,
      child: DynamicContainer(
        child: Row(
          children: children,
        ),
      ),
    );
  }
}
