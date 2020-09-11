import 'package:flyrics/api/config.dart';
import 'package:flyrics/api/http_client.dart';

import 'genius.dart';
import 'spotify.dart';
import 'terminal.dart';

class Api {
  final ConfigService _config;
  final HttpClient client;
  final TerminalService terminal;
  SpotifyService spotify;
  GeniusService genius;

  Api(
    this._config, {
    this.client = const HttpClient(),
    this.terminal = const TerminalService(),
  }) {
    var geniusAccessToken = _getConfig('GENIUS_API_KEY');

    spotify = SpotifyService(client, terminal: terminal);
    genius = GeniusService(client, accessToken: geniusAccessToken);
  }

  String _getConfig(String key) => _config.get(key);
}
