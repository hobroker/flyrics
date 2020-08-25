import 'package:flutter/material.dart';

class TrackDetailsWrapper extends StatelessWidget {
  final Widget child;

  TrackDetailsWrapper({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
