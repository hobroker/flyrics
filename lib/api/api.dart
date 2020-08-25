import 'package:flyrics/utils/secrets.dart';

import 'genius_api.dart';
import 'shell_api.dart';
import 'spotify_api.dart';
import 'util_api.dart';

class Api {
  Secrets _secrets;
  SpotifyApi spotify;
  GeniusApi genius;
  ShellApi shell;
  UtilApi util;

  void init(Secrets secrets) {
    _secrets = secrets;
    var geniusAccessToken = _getSecret('GENIUS_API_KEY');

    shell = ShellApi();
    util = UtilApi();
    spotify = SpotifyApi(shell: shell);
    genius = GeniusApi(accessToken: geniusAccessToken);
  }

  String _getSecret(String key) => _secrets.getEnv(key);
}

var api = Api();
