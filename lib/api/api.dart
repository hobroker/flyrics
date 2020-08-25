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

  void init(Config config) {
    _config = config;
    var geniusAccessToken = _getConfig('GENIUS_API_KEY');

    shell = ShellApi();
    spotify = SpotifyApi(shell: shell);
    url = UrlApi(shell: shell);
    genius = GeniusApi(accessToken: geniusAccessToken);
  }

  String _getConfig(String key) => _config.get(key);
}

var api = Api();
