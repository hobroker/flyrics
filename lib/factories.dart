import 'package:flutter/material.dart';
import 'package:flyrics/modules/provider/provider.dart';
import 'package:flyrics/services/api.dart';
import 'package:flyrics/services/config.dart';
import 'package:flyrics/services/terminal.dart';
import 'package:flyrics/services/ux.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/color.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/track.dart';

final uxFactory = (ThemeData theme) => (Get _) => UX(theme: theme);

final playerFactory = (Get get) => PlayerStore(
      api: get(),
      artwork: ArtworkStore(get()),
      color: ColorStore(ux: get()),
      lyrics: LyricsStore(api: get()),
      track: TrackStore(api: get()),
    );

final apiFactory = (ConfigService config) => (Get get) => ApiService(
      config: config,
      terminal: TerminalService(),
    );
