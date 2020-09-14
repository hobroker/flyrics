import 'package:flutter/material.dart';
import 'package:flyrics/api/config.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/services_injector.dart';

Future<void> main() async {
  final config = await ConfigService.init();

  runApp(
    ServicesInjector(
      config: config,
      child: App(),
    ),
  );
}
