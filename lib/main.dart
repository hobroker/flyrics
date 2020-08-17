import 'package:flutter/material.dart';
import 'package:flyrics/epics/index.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux_logging/redux_logging.dart';

import 'models/app_state.dart';
import 'reducers/app_state.dart';
import 'views/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var epicMiddleware = new EpicMiddleware(epic);
  var store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: [new LoggingMiddleware.printer(), epicMiddleware],
  );

  runApp(App(
    store: store,
  ));
}
