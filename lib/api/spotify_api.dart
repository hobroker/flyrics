import 'dart:convert';

import 'package:flyrics/api/scripts.dart';
import 'package:flyrics/api/shell_api.dart';
import 'package:flyrics/models/track.dart';

class SpotifyApi {
  final ShellApi shell;

  SpotifyApi({this.shell});

  Future<bool> isRunning() async {
    var result = await shell.runAppleScript(Scripts.isSpotifyRunning);

    return result == 'true';
  }

  Future<Track> fetchCurrentTrack() async {
    var result = await shell.runAppleScript(Scripts.getCurrentTrack);
    var data = json.decode(result);
    var track = Track.fromJson(data);

    return track;
  }
}
