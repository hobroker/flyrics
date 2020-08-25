import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/shell.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/utils/secrets.dart';

class Api {
  Spotify spotify;
  Genius genius;
  Shell shell;

  Api();

  init() {
    var geniusAccessToken = Secrets.getEnv('GENIUS_API_KEY');

    this.shell = Shell();
    this.spotify = Spotify(shell: this.shell);
    this.genius = Genius(accessToken: geniusAccessToken);
  }
}

var api = Api();
