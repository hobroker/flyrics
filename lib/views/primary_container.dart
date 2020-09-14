import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/provider.dart';

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
    final _track = useTrackStore();

    return O(
      () => AnimatedContainer(
        width: width,
        height: height,
        duration: UX.transitionDuration,
        decoration: BoxDecoration(
          color: _track.artwork.dominantColor,
        ),
        child: child,
      ),
    );
  }
}
