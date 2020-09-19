import 'package:flyrics/services/api.dart';
import 'package:flyrics/services/config.dart';
import 'package:flyrics/services/terminal.dart';
import 'package:flyrics/services/ux.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/theme.dart';
import 'package:flyrics/stores/track.dart';

typedef Get = T Function<T>();
typedef ProviderFactory<T extends Object> = T Function(Get get);

final uxProvider = (Get get) => UX(theme: get());

final playerProvider = (Get get) => PlayerStore(
      api: get(),
      theme: get(),
      artwork: ArtworkStore(api: get()),
      lyrics: LyricsStore(api: get()),
      track: TrackStore(api: get()),
    );

final themeProvider = (Get get) => ThemeStore();

final apiProvider = (ConfigService config) => (Get get) => ApiService(
      config: config,
      terminal: TerminalService(),
    );
