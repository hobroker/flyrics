import 'package:flutter/material.dart';
import 'package:flyrics/containers/dynamic_container.dart';
import 'package:flyrics/selectors/app.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/views/layout/layout_placeholder.dart';
import 'package:flyrics/views/layout/layout_screen.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: isSpotifyRunning,
      builder: (context, isRunning) {
        return Scaffold(
          body: DynamicContainer(
            width: UI(context).appWidth,
            height: UI(context).appHeight,
            child: isRunning ? LayoutScreeen() : LayoutPlaceholder(),
          ),
        );
      },
    );
  }
}
