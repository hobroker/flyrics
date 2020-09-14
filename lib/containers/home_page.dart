import 'package:flutter/material.dart';
import 'package:flyrics/containers/page_wrapper.dart';
import 'package:flyrics/modules/injection.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/views/layout/layout_screen.dart';
import 'package:flyrics/views/primary_container.dart';

class HomePage extends StatelessWidget {
  void _onCreate(player) => (player as PlayerStore).start();

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Injection(
        provider: (find) => PlayerStore(
          terminalService: find(),
          spotifyService: find(),
          geniusService: find(),
          ux: find(),
        ),
        onCreate: _onCreate,
        child: Scaffold(
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
