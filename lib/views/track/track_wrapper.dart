import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';

class TrackWrapper extends StatelessWidget {
  final Widget child;

  TrackWrapper({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: UX.spacingUnit,
          horizontal: UX.spacingUnit * 2,
        ),
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
