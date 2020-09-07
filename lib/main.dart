import 'package:flutter/material.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/modules/i18n_delegate.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/store/store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  final store = createStore();

  runApp(
    App(
      store: store,
      localizationsDelegate: i18nDelegate,
    ),
  );
}
