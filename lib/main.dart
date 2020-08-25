import 'package:flutter/material.dart';
import 'package:flyrics/timers/track_refresh.dart';
import 'package:redux/redux.dart';

import 'actions/app_actions.dart';
import 'api/api.dart';
import 'store/store.dart';
import 'utils/config.dart';
import 'views/app.dart';

void startTimers(Store store) {
  trackRefresh(
    store,
    every: Duration(milliseconds: 1500),
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.init().then((secrets) => api.init(secrets));

  var store = createStore();

  runApp(
    App(
      store: store,
      onLoad: () {
        store.dispatch(AppStartedAction());
        startTimers(store);
      },
    ),
  );
}
