import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/utils/ux.dart';

class LayoutBody extends StatelessWidget {
  final Widget child;

  LayoutBody({
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
        padding: EdgeInsets.only(
          top: UX.spacingUnit * 2,
          left: UX.spacingUnit * 2,
          right: UX.spacingUnit,
        ),
      ),
    );
  }
}
