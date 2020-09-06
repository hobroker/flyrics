import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flyrics/views/primary_container.dart';
import 'package:flyrics/hooks/effect.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/player.dart';
import 'package:flyrics/utils/conditional.dart';
import 'package:flyrics/views/layout/layout_placeholder.dart';
import 'package:flyrics/views/layout/layout_screen.dart';

class HomePage extends HookWidget {
  final Function onInit;

  const HomePage({
    Key key,
    this.onInit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isRunning = useSelector<AppState, bool>(isPlayerRunning);

    useEffectOnce(onInit);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return PrimaryContainer(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Conditional.single(
                when: isRunning,
                render: () => LayoutScreeen(),
                fallback: () => LayoutPlaceholder(),
              ));
        },
      ),
    );
  }
}
