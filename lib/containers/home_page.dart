import 'package:flutter/material.dart';
import 'package:flyrics/containers/player_injection.dart';
import 'package:flyrics/containers/ux_injection.dart';
import 'package:flyrics/views/layout/layout_screen.dart';
import 'package:flyrics/views/primary_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UXInjection(
      PlayerInjection(
        Scaffold(
          body: LayoutBuilder(builder: (context, constraints) {
            return PrimaryContainer(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: LayoutScreeen(),
            );
          }),
        ),
      ),
    );
  }
}
