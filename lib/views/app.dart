import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/views/homePage.dart';

class App extends StatefulWidget {
  final Store<AppState> store;
  final Function onLoad;

  const App({
    Key key,
    this.store,
    this.onLoad,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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
        home: HomePage(),
        theme: ThemeData(
          primaryColor: const Color(0xff282828),
          accentColor: const Color(0xff62D36E),
        ),
      ),
    );
  }
}
