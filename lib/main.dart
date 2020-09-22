import 'package:flutter/material.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/providers.dart';
import 'package:flyrics/services/config.dart';
import 'package:jab/jab.dart';

Future main() async {
  final config = await ConfigService.create();

  Jab.provideForRoot([
    apiProvider(config),
    themeProvider,
    uxProvider,
    playerProvider,
  ]);

  runApp(App());
}
