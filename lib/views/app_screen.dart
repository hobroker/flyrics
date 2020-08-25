import 'package:flutter/material.dart';
import 'package:flyrics/containers/app_layout.dart';

class AppScreen extends StatefulWidget {
  final Function onInit;

  const AppScreen({
    Key key,
    this.onInit,
  }) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppLayout(),
    );
  }
}
