import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';

class TrackWrapper extends HookWidget {
  final Widget child;

  TrackWrapper({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: ux.spacingUnit,
          horizontal: ux.spacingUnit * 2,
        ),
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
