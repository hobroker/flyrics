import 'dart:convert';

import 'package:flyrics/api/http_client.dart';
import 'package:flyrics/api/scripts.dart';
import 'package:flyrics/api/shell_api.dart';
import 'package:flyrics/models/track.dart';
import 'package:flyrics/utils/serialize.dart';

class SpotifyApi {
  final Terminal shell;
  final HttpClient client;

  SpotifyApi(this.client, {this.shell});

  Future<bool> isRunning() async {
    final result = await shell.runAppleScript(Scripts.isSpotifyRunning);

    return result == 'true';
  }

  Future<Track> fetchCurrentTrack() async {
    final willHaveData = await isRunning();
    if (!willHaveData) {
      return null;
    }

    final result = await shell.runAppleScript(Scripts.getCurrentTrack);
    if (result == null || result.isEmpty) {
      return null;
    }

    var data = json.decode(result);
    final track = deserialize<Track>(data);

    return track;
  }

  Future<List<int>> getImageBytes(String url) async => client.getBytes(url);
}
