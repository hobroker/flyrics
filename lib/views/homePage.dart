import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/containers/header.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: UI(context).appWidth,
          height: UI(context).appHeight,
          child: Column(
            children: [
              Header(),
            ],
          ),
        ),
      ),
    );
  }
}
