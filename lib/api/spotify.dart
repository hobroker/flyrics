import 'dart:convert';

import 'package:flyrics/api/scripts.dart';
import 'package:flyrics/api/shell.dart';
import 'package:flyrics/models/track.dart';

class Spotify {
  var shell = new Shell();

  Spotify();

  static Future<bool> isRunning() async {
    final String result = await Shell.runAppleScript(Scripts.isSpotifyRunning);

    return result == 'true';
  }

  static Future<Track> fetchCurrentTrack() async {
    final String result = await Shell.runAppleScript(Scripts.getCurrentTrack);
    var data = json.decode(result);
    var track = Track.fromJson(data);

    return track;
  }
}
