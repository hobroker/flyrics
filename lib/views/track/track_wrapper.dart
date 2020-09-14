import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/locator.dart';

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
          vertical: I<UX>().spacingUnit,
          horizontal: I<UX>().spacingUnit * 2,
        ),
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
