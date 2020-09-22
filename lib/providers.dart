import 'dart:io';

import 'package:flyrics/services/api.dart';
import 'package:flyrics/services/spotify.dart';
import 'package:flyrics/services/terminal.dart';
import 'package:flyrics/services/ux.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/theme.dart';
import 'package:flyrics/stores/track.dart';

typedef Get = T Function<T>();
typedef ProviderFactory<T extends Object> = T Function(Get get);

final themeProvider = (Get get) => ThemeStore();

final uxProvider = (Get get) => UX(theme: get());

final terminalProvider = (Get get) => TerminalService();

final spotifyProvider = (Get get) => Platform.isMacOS
    ? SpotifyMacService(terminal: get())
    : throw UnimplementedError(
        'No SpotifyService for platform ${Platform.isMacOS}');

final apiProvider = (Get get) => ApiService(
      spotify: get(),
      config: get(),
      terminal: get(),
    );

final playerProvider = (Get get) => PlayerStore(
      api: get(),
      theme: get(),
      artwork: ArtworkStore(api: get()),
      lyrics: LyricsStore(api: get()),
      track: TrackStore(api: get()),
    );
