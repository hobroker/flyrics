import 'package:flyrics/utils/secrets.dart';

import 'genius_api.dart';
import 'shell_api.dart';
import 'spotify_api.dart';

class Api {
  SpotifyApi spotify;
  GeniusApi genius;
  Secrets _secrets;
  ShellApi _shell;

  void init(Secrets secrets) {
    _secrets = secrets;
    var geniusAccessToken = _getSecret('GENIUS_API_KEY');

    _shell = ShellApi();
    spotify = SpotifyApi(shell: _shell);
    genius = GeniusApi(accessToken: geniusAccessToken);
  }

  String _getSecret(String key) => _secrets.getEnv(key);
}

var api = Api();
