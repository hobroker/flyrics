import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/containers/home_page.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/states/player_store.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> store;
  final FlutterI18nDelegate localizationsDelegate;

  const App({
    Key key,
    this.store,
    this.localizationsDelegate,
  }) : super(key: key);

  void _onInit() {
    final _player = I<PlayerStore>();

    _player.fetchIsRunning();
    store.dispatch(AppStartedAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [localizationsDelegate],
        supportedLocales: [Locale('en', '')],
        builder: FlutterI18n.rootAppBuilder(),
        home: HomePage(
          onInit: _onInit,
        ),
      ),
    );
  }
}
