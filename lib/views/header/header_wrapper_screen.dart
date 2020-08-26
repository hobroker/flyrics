import 'package:flutter/material.dart';
import 'package:flyrics/containers/dynamic_container.dart';

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
    return DynamicContainer(
      child: Container(
        child: Row(
          children: children,
        ),
      ),
    );
  }
}
