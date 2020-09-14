import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/effect.dart';
import 'package:flyrics/hooks/provider.dart';
import 'package:flyrics/views/layout/layout_screen.dart';
import 'package:flyrics/views/primary_container.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _player = usePlayerStore();
    useEffectOnce(_player.start);

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return PrimaryContainer(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: LayoutScreeen(),
        );
      }),
    );
  }
}
