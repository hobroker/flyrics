import 'package:flutter/foundation.dart';
import 'package:flyrics/services/config.dart';
import 'package:flyrics/services/genius.dart';
import 'package:flyrics/services/http_client.dart';
import 'package:flyrics/services/native.dart';
import 'package:flyrics/services/spotify.dart';
import 'package:flyrics/services/terminal.dart';

@immutable
class ApiService {
  final SpotifyService spotify;
  final GeniusService genius;
  final NativeService native;

  ApiService({
    @required ConfigService config,
    @required TerminalService terminal,
  })  : genius = GeniusService(
          config: config,
          client: HttpClient(),
        ),
        spotify = SpotifyService(
          client: HttpClient(),
          terminal: terminal,
        ),
        native = NativeService(
          terminal: terminal,
        );
}
