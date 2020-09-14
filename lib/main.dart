import 'package:flutter/material.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/config.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/modules/locator.dart';

Future<void> main() async {
  final config = await ConfigService.init();
  final api = Api(config);

  setupLocator(api: api);

  runApp(App());
}
