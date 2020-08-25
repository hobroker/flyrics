import 'package:flutter/material.dart';
import 'package:flyrics/timers/track_refresh.dart';
import 'package:flyrics/utils/debug.dart';
import 'package:redux/redux.dart';
import 'utils/secrets.dart';
import 'actions/app_actions.dart';
import 'api/api.dart';
import 'store/create_store.dart';
import 'views/app.dart';

void startTimers(Store store) {
  trackRefresh(
    store,
    every: Duration(milliseconds: 1500),
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Secrets.init().then((secrets) => api.init(secrets));

  var store = createStore();

  runApp(App(
    store: store,
    onLoad: () {
      startTimers(store);
      store.dispatch(AppStartedAction());
    },
  ));
}
