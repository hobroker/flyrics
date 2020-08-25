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

  init(Secrets secrets) {
    this._secrets = secrets;
    var geniusAccessToken = this._getSecret('GENIUS_API_KEY');

    this.shell = ShellApi();
    this.util = UtilApi();
    this.spotify = SpotifyApi(shell: this.shell);
    this.genius = GeniusApi(accessToken: geniusAccessToken);
  }

  String _getSecret(String key) => this._secrets.getEnv(key);
}

var api = Api();
