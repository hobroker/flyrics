import 'package:flutter/material.dart';
import 'package:flyrics/constants/sizing.dart';
import 'header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Sizing(context).appWidth,
          height: Sizing(context).appHeight,
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
