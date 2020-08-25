import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flyrics/epics/index.dart';

import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'actions/app_actions.dart';
import 'actions/track_actions.dart';
import 'models/app_state.dart';
import 'reducers/app_state.dart';
import 'views/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var epicMiddleware = new EpicMiddleware(epic);
  var store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [
      epicMiddleware,
//      new LoggingMiddleware.printer(),
    ],
  );

//  store.onChange.listen((event) {
//    print(event);
//  });

  Timer.periodic(new Duration(milliseconds: 1500), (timer) {
    store.dispatch(FetchTrackStartAction());
  });

  runApp(App(
    store: store,
    onLoad: () => store.dispatch(AppStartedAction()),
  ));
}
