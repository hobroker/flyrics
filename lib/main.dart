import 'package:flutter/material.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/player.dart';

import 'api/config.dart';

Future<void> main() async {
  final config = await ConfigService.init();
  final api = Api(config);
  final player = PlayerStore();

  await setupLocator(
    api: api,
    player: player,
  );

  runApp(App());
}
