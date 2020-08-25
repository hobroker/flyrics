import 'package:flutter/material.dart';
import 'package:flyrics/selectors/app.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/layout/placeholder.dart';
import 'package:flyrics/views/layout/screen.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: isSpotifyRunning,
      builder: (context, isRunning) =>
          isRunning ? LayoutScreeen() : LayoutPlaceholder(),
    );
  }
}
