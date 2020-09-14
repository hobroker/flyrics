import 'package:flutter/material.dart';
import 'package:flyrics/api/config.dart';
import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/http_client.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/api/terminal.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/modules/injection/injection.dart';

Future<void> main() async {
  final config = await ConfigService.init();

  Injection.provideForRoot([
    (_) => HttpClient(),
    (_) => TerminalService(),
    (find) => SpotifyService(client: find(), terminal: find()),
    (find) => GeniusService(config: config, client: find()),
  ]);

  runApp(
    App(),
  );
}
