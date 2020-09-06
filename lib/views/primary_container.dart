import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/constants/ux.dart';

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
    final backgroundColor = useSelector<AppState, Color>(resolvedDominantColor);

    return AnimatedContainer(
      width: width,
      height: height,
      duration: UX.transitionDuration,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
