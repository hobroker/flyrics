import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/containers/app_layout.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: UI(context).appWidth,
        height: UI(context).appHeight,
        child: AppLayout(),
      ),
    );
  }
}
