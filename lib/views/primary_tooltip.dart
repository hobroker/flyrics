import 'package:flutter/material.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/utils/o.dart';

class PrimaryTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  final _track = I<TrackStore>();

  PrimaryTooltip({
    Key key,
    @required this.message,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return O(
      () => Tooltip(
        message: message,
        child: child,
        verticalOffset: 16,
        textStyle: TextStyle(
          color: _track.artwork.dominantColor,
          height: 1,
        ),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _track.artwork.textColor,
        ),
      ),
    );
  }
}
