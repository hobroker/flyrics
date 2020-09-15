import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/factories.dart';
import 'package:flyrics/hooks/use_theme.dart';
import 'package:flyrics/modules/provider/provider.dart';
import 'package:flyrics/views/layout/layout_screen.dart';
import 'package:flyrics/views/primary_container.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Provider(
      factories: [
        uxFactory(theme),
        playerFactory,
      ],
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return PrimaryContainer(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: LayoutScreeen(),
          );
        }),
      ),
    );
  }
}
