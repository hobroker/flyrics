import 'package:flutter/material.dart';
import 'package:flyrics/views/layout/layout_screen.dart';
import 'package:flyrics/views/primary_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return PrimaryContainer(
          constraints: constraints,
          child: LayoutScreeen(),
        );
      }),
    );
  }
}
