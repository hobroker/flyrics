import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'models/app_state.dart';
import 'reducers/app_state.dart';
import 'views/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App(
    store: Store<AppState>(
      appReducer,
      initialState: AppState.loading(),
    ),
  ));
}
