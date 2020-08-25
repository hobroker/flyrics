import 'package:flyrics/utils/config.dart';

import 'genius_api.dart';
import 'shell_api.dart';
import 'spotify_api.dart';

class Api {
  SpotifyApi spotify;
  GeniusApi genius;
  Config _config;
  ShellApi _shell;

  void init(Config config) {
    _config = config;
    var geniusAccessToken = _getConfig('GENIUS_API_KEY');

    _shell = ShellApi();
    spotify = SpotifyApi(shell: _shell);
    genius = GeniusApi(accessToken: geniusAccessToken);
  }

  String _getConfig(String key) => _config.get(key);
}

var api = Api();
