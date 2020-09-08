import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/effect.dart';
import 'package:flyrics/views/layout/layout_screen.dart';
import 'package:flyrics/views/primary_container.dart';

class HomePage extends HookWidget {
  final Function onInit;

  const HomePage({
    Key key,
    this.onInit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffectOnce(onInit);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return PrimaryContainer(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: LayoutScreeen(),
          );
        },
      ),
    );
  }
}
