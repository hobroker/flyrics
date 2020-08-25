import 'dart:convert';

import 'package:flyrics/api/scripts.dart';
import 'package:flyrics/api/shell.dart';
import 'package:flyrics/models/track.dart';

class Spotify {
  final Shell shell;

  Spotify({this.shell});

  Future<bool> isRunning() async {
    final String result = await this.shell.runAppleScript(Scripts.isSpotifyRunning);

    return result == 'true';
  }

  Future<Track> fetchCurrentTrack() async {
    final String result = await this.shell.runAppleScript(Scripts.getCurrentTrack);
    var data = json.decode(result);
    var track = Track.fromJson(data);

    return track;
  }
}
