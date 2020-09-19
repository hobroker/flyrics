import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';

class PrimaryTooltip extends HookWidget {
  final String message;
  final Widget child;

  PrimaryTooltip({
    Key key,
    @required this.message,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return O(
      () => Tooltip(
        message: message,
        child: child,
        verticalOffset: 16,
        textStyle: TextStyle(
          color: ux.primaryColor,
          height: 1,
        ),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ux.textColor,
        ),
      ),
    );
  }
}
