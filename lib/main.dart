import 'package:flutter/material.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/factories.dart';
import 'package:flyrics/modules/provider/injection.dart';
import 'package:flyrics/services/config.dart';

Future<void> main() async {
  final config = await ConfigService.create();

  Provider.provideForRoot([
    httpClientFactory,
    terminalFactory,
    spotifyFactory,
    geniusFactory(config),
  ]);

  runApp(App());
}
