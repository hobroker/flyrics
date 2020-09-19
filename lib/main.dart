import 'package:flutter/material.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/factories.dart';
import 'package:flyrics/services/config.dart';
import 'package:jab/jab.dart';

Future<void> main() async {
  final config = await ConfigService.create();

  Jab.provideForRoot([
    apiFactory(config),
  ]);

  runApp(App());
}
