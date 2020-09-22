import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flyrics/services/http_client.dart';
import 'package:flyrics/services/terminal.dart';

part 'parts/spotify_scripts.dart';

abstract class SpotifyService {
  Future<List<int>> getImageBytes(String url);

  Future<bool> isRunning();

  Future<Map> fetchCurrentTrack();
}

class SpotifyMacService extends SpotifyService {
  final TerminalService terminal;
  final HttpClient client;

  SpotifyMacService({
    this.client = const HttpClient(),
    @required this.terminal,
  });

  @override
  Future<bool> isRunning() async {
    final result = await terminal.runAppleScript(_isSpotifyRunning);

    return result == 'true';
  }

  @override
  Future<Map> fetchCurrentTrack() async {
    final result = await terminal.runAppleScript(_getCurrentTrack);
    if (result == null || result.isEmpty) {
      return null;
    }

    return json.decode(result);
  }

  @override
  Future<List<int>> getImageBytes(String url) async => client.getBytes(url);
}
