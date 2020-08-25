import 'package:flutter/material.dart';

import 'actions/app_actions.dart';
import 'api/api.dart';
import 'store/store.dart';
import 'utils/config.dart';
import 'views/app_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.init().then((secrets) => api.init(secrets));

  var store = createStore();

  runApp(
    AppScreen(
      store: store,
      onLoad: () {
        store.dispatch(AppStartedAction());
      },
    ),
  );
}
