import 'dart:convert';

import 'package:flyrics/api/http_client.dart';
import 'package:flyrics/api/scripts.dart';
import 'package:flyrics/api/shell_api.dart';
import 'package:flyrics/models/track_model.dart';

class SpotifyApi {
  final ShellApi shell;
  final HttpClient client;

  SpotifyApi(this.client, {this.shell});

  Future<bool> isRunning() async {
    var result = await shell.runAppleScript(Scripts.isSpotifyRunning);

    return result == 'true';
  }

  Future<TrackModel> fetchCurrentTrack() async {
    var hasData = await isRunning();
    if (!hasData) {
      return null;
    }

    var result = await shell.runAppleScript(Scripts.getCurrentTrack);
    if (result == null || result.isEmpty) {
      return null;
    }

    var data = json.decode(result);
    var track = TrackModel.fromJson(data);

    return track;
  }

  Future<List<int>> getImageBytes(String url) async {
    var response = await client.getRaw(url);

    return response.bodyBytes;
  }
}
