import 'package:flutter/material.dart';

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
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
