import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flyrics/containers/app_layout.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:redux/redux.dart';

class AppScreen extends StatefulWidget {
  final Store<AppState> store;
  final Function onLoad;

  const AppScreen({
    Key key,
    this.store,
    this.onLoad,
  }) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  void initState() {
    super.initState();
    widget.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: widget.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppLayout(),
      ),
    );
  }
}
