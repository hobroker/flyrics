import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/views/homePage.dart';
import 'package:flyrics/actions/app_actions.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.store.dispatch(AppStartedAction());

    return StoreProvider(
      store: this.store,
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primaryColor: const Color(0xff282828),
          accentColor: const Color(0xff62D36E),
        ),
      ),
    );
  }
}
