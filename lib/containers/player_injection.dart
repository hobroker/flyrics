import 'package:flutter/material.dart';
import 'package:flyrics/modules/injection.dart';
import 'package:flyrics/stores/player.dart';

class PlayerInjection extends StatelessWidget {
  final Widget child;

  const PlayerInjection(this.child, {Key key}) : super(key: key);

  void _onCreate(player) => (player as PlayerStore).start();

  @override
  Widget build(BuildContext context) {
    return Injection(
      provider: (find) => PlayerStore(
        terminalService: find(),
        spotifyService: find(),
        geniusService: find(),
        ux: find(),
      ),
      onCreate: _onCreate,
      child: child,
    );
  }
}
