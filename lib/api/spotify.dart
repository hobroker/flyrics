import 'dart:convert';

import 'package:flyrics/api/scripts.dart';
import 'package:flyrics/api/shell.dart';
import 'package:flyrics/models/track.dart';

class Spotify {
  var shell = new Shell();

  Spotify();

  Future<bool> isRunning() async {
    final String result =
        await this.shell.runAppleScript(Scripts.isSpotifyRunning);

    return result == 'true';
  }

  Future<Track> fetchCurrentTrack() async {
    final String result =
        await this.shell.runAppleScript(Scripts.getCurrentTrack);

    var track = new Track.fromJson(json.decode(result));

    return track;
  }
}
