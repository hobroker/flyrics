import 'dart:convert';

import 'package:flyrics/api/scripts.dart';
import 'package:flyrics/api/shell_api.dart';
import 'package:flyrics/models/track_model.dart';
import 'package:http/http.dart' as http;

class SpotifyApi {
  final ShellApi shell;

  SpotifyApi({this.shell});

  Future<bool> isRunning() async {
    var result = await shell.runAppleScript(Scripts.isSpotifyRunning);

    return result == 'true';
  }

  Future<TrackModel> fetchCurrentTrack() async {
    var result = await shell.runAppleScript(Scripts.getCurrentTrack);
    var data = json.decode(result);
    var track = TrackModel.fromJson(data);

    return track;
  }

  Future<List<int>> getImageBytes(String url) async {
    var response = await http.get(url);

    return response.bodyBytes;
  }
}
