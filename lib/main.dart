import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flyrics/epics/index.dart';
import 'package:flyrics/utils/distinct_store.dart';
import 'package:flyrics/utils/secrets.dart';
import 'package:redux_epics/redux_epics.dart';
import 'actions/app_actions.dart';
import 'actions/track_actions.dart';
import 'api/api.dart';
import 'models/app_state.dart';
import 'reducers/app_state.dart';
import 'views/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Secrets.init().then((v) => api.init());

  var epicMiddleware = new EpicMiddleware(epic);
  var store = DistinctStore<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [
      epicMiddleware,
//      new LoggingMiddleware.printer(),
    ],
  );

  Timer.periodic(new Duration(milliseconds: 1500), (timer) {
    store.dispatch(FetchTrackStartAction());
  });

  runApp(App(
    store: store,
    onLoad: () => store.dispatch(AppStartedAction()),
  ));
}
