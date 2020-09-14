import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/locator.dart';

class FooterSliver extends StatelessWidget {
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
        height: I<UX>().footerHeight,
        margin: EdgeInsets.all(I<UX>().spacingUnit * 2),
      ),
    );
  }
}
