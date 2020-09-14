import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';

class FooterSliver extends HookWidget {
  final Widget child;

  FooterSliver({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: false,
      child: Container(
        child: child,
        height: ux.footerHeight,
        margin: EdgeInsets.all(ux.spacingUnit * 2),
      ),
    );
  }
}
