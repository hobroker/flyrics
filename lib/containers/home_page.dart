import 'package:flutter/material.dart';
import 'package:flyrics/containers/dynamic_container.dart';
import 'package:flyrics/selectors/player.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/utils/conditional.dart';
import 'package:flyrics/views/layout/layout_placeholder.dart';
import 'package:flyrics/views/layout/layout_screen.dart';

class HomePage extends StatefulWidget {
  final Function onInit;

  const HomePage({
    Key key,
    this.onInit,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Connector.state(
            converter: isPlayerRunning,
            builder: (context, isRunning) {
              return DynamicContainer(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Conditional.single(
                  when: isRunning,
                  render: () => LayoutScreeen(),
                  fallback: () => LayoutPlaceholder(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
