import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/containers/o.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  final _track = I<TrackStore>();

  PrimaryContainer({
    Key key,
    @required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
