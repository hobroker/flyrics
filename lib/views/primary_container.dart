import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';

class PrimaryContainer extends HookWidget {
  final Widget child;
  final double width;
  final double height;

  PrimaryContainer({
    Key key,
    @required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return O(
      () => AnimatedContainer(
        width: width,
        height: height,
        duration: ux.transitionDuration,
        color: ux.primaryColor,
        child: child,
      ),
    );
  }
}
