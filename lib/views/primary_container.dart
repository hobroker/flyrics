import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';

class PrimaryContainer extends HookWidget {
  final Widget child;
  final BoxConstraints constraints;

  PrimaryContainer({
    Key key,
    @required this.child,
    this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return O(
      () => AnimatedContainer(
        width: constraints?.maxWidth,
        height: constraints?.maxHeight,
        duration: ux.transitionDuration,
        color: ux.primaryColor,
        child: child,
      ),
    );
  }
}
