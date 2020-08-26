import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/utils/ux.dart';

class LayoutFooter extends StatelessWidget {
  final double height = 20;
  final Widget child;

  LayoutFooter({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: false,
      child: Container(
        child: child,
        height: height,
        margin: EdgeInsets.all(UX.spacingUnit * 2),
      ),
    );
  }
}
