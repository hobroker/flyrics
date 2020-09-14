import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';

class BodySliver extends HookWidget {
  final Widget child;

  BodySliver({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spacingUnit = useUX().spacingUnit;

    return SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: false,
      child: Container(
        child: child,
        padding: EdgeInsets.only(
          top: spacingUnit * 2,
          left: spacingUnit * 2,
          right: spacingUnit,
        ),
      ),
    );
  }
}
