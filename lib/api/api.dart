import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/shell.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/utils/secrets.dart';

class Api {
  Secrets _secrets;
  Spotify spotify;
  Genius genius;
  Shell shell;

  getSecret(String key) => this._secrets.getEnv(key);

  init(Secrets secrets) {
    this._secrets = secrets;
    var geniusAccessToken = this.getSecret('GENIUS_API_KEY');

    this.shell = Shell();
    this.spotify = Spotify(shell: this.shell);
    this.genius = Genius(accessToken: geniusAccessToken);
  }
}

var api = Api();
