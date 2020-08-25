import 'package:flutter/material.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/store/store.dart';
import 'package:flyrics/utils/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.init().then((secrets) => api.init(secrets));

  var store = createStore();

  runApp(
    App(
      store: store,
    ),
  );
}
