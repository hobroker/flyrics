import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';

class FooterSliver extends StatelessWidget {
  final double height = 20;
  final Widget child;

  FooterSliver({
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
