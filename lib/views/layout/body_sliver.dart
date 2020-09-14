import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/locator.dart';

class BodySliver extends StatelessWidget {
  final Widget child;

  BodySliver({
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
          top: I<UX>().spacingUnit * 2,
          left: I<UX>().spacingUnit * 2,
          right: I<UX>().spacingUnit,
        ),
      ),
    );
  }
}
