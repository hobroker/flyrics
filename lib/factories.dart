import 'package:flutter/material.dart';
import 'package:flyrics/modules/provider/injection.dart';
import 'package:flyrics/services/config.dart';
import 'package:flyrics/services/genius.dart';
import 'package:flyrics/services/http_client.dart';
import 'package:flyrics/services/spotify.dart';
import 'package:flyrics/services/terminal.dart';
import 'package:flyrics/services/ux.dart';
import 'package:flyrics/stores/player.dart';

final uxFactory = (ThemeData theme) => (Get _) => UX(theme: theme);

final geniusFactory = (ConfigService config) => (Get get) => GeniusService(
      config: config,
      client: get(),
    );

final playerFactory = (Get get) => PlayerStore(
      terminalService: get(),
      spotifyService: get(),
      geniusService: get(),
      ux: get(),
    );

final httpClientFactory = (_) => HttpClient();

final terminalFactory = (_) => TerminalService();

final spotifyFactory = (Get get) => SpotifyService(
      client: get(),
      terminal: get(),
    );
