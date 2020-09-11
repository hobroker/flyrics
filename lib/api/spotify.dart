import 'dart:convert';

import 'package:flyrics/api/http_client.dart';
import 'package:flyrics/api/terminal.dart';

part 'parts/spotify_scripts.dart';

class SpotifyService {
  final TerminalService terminal;
  final HttpClient client;

  SpotifyService(this.client, {this.terminal});

  Future<bool> isRunning() async {
    final result = await terminal.runAppleScript(_isSpotifyRunning);

    return result == 'true';
  }

  Future<Map> fetchCurrentTrack() async {
    final result = await terminal.runAppleScript(_getCurrentTrack);
    if (result == null || result.isEmpty) {
      return null;
    }

    return json.decode(result);
  }

  Future<List<int>> getImageBytes(String url) async => client.getBytes(url);
}
