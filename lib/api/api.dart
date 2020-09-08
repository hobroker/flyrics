import 'package:flyrics/api/http_client.dart';
import 'package:flyrics/modules/config.dart';

import 'genius_api.dart';
import 'shell_api.dart';
import 'spotify_api.dart';

class Api {
  final Config _config;
  SpotifyApi spotify;
  GeniusApi genius;
  Terminal shell;
  HttpClient client;

  Api(
    this._config, {
    this.client = const HttpClient(),
    this.shell = const Terminal(),
  }) {
    var geniusAccessToken = _getConfig('GENIUS_API_KEY');

    spotify = SpotifyApi(client, shell: shell);
    genius = GeniusApi(client, accessToken: geniusAccessToken);
  }

  String _getConfig(String key) => _config.get(key);
}
