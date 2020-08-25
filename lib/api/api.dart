import 'package:flyrics/api/http_client.dart';
import 'package:flyrics/api/url.dart';
import 'package:flyrics/utils/config.dart';

import 'genius_api.dart';
import 'shell_api.dart';
import 'spotify_api.dart';

class Api {
  SpotifyApi spotify;
  GeniusApi genius;
  Config _config;
  ShellApi shell;
  UrlApi url;
  HttpClient client;

  Api init(Config config, {httpClient}) {
    _config = config;
    var geniusAccessToken = _getConfig('GENIUS_API_KEY');

    client = httpClient ?? HttpClient();
    shell = ShellApi();
    spotify = SpotifyApi(client, shell: shell);
    url = UrlApi(shell: shell);
    genius = GeniusApi(client, accessToken: geniusAccessToken);

    return this;
  }

  String _getConfig(String key) => _config.get(key);
}

var api = Api();
