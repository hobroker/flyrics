import 'package:flutter/material.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/config.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/modules/injection/injection.dart';

Future<void> main() async {
  final config = await ConfigService.init();

  runApp(Injection(
    providers: () => [
      (_) => Api(config),
      (_) => UX(),
    ],
    child: App(),
  ));
}
