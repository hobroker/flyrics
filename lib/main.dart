import 'package:flutter/material.dart';

import 'utils/secrets.dart';
import 'actions/app_actions.dart';
import 'api/api.dart';
import 'create_store.dart';
import 'views/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Secrets.init().then((secrets) => api.init(secrets));

  var store = createStore();

  runApp(App(
    store: store,
    onLoad: () => store.dispatch(AppStartedAction()),
  ));
}
