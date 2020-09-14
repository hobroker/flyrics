import 'package:flutter/material.dart';
import 'package:flyrics/containers/app.dart';
import 'package:flyrics/modules/injection.dart';
import 'package:flyrics/services/config.dart';
import 'package:flyrics/services/genius.dart';
import 'package:flyrics/services/http_client.dart';
import 'package:flyrics/services/spotify.dart';
import 'package:flyrics/services/terminal.dart';

Future<void> main() async {
  final config = await ConfigService.create();

  Injection.provideForRoot([
    (_) => HttpClient(),
    (_) => TerminalService(),
    (find) => SpotifyService(client: find(), terminal: find()),
    (find) => GeniusService(config: config, client: find()),
  ]);

  runApp(App());
}
