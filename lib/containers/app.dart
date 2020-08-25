import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/views/app_screen.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({
    Key key,
    this.store,
  }) : super(key: key);

  void _onInit() {
    store.dispatch(AppStartedAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: AppScreen(
        onInit: _onInit,
      ),
    );
  }
}
