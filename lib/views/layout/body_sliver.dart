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
    final ux = useUX();

    return SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: false,
      child: Container(
        child: child,
        padding: EdgeInsets.only(
          top: ux.spacingUnit * 2,
          left: ux.spacingUnit * 2,
          right: ux.spacingUnit,
        ),
      ),
    );
  }
}
