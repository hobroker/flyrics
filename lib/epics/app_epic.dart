import 'package:flyrics/models/state/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

import 'artwork.dart';
import 'color.dart';
import 'lyrics.dart';
import 'search.dart';
import 'startup.dart';
import 'timer.dart';
import 'track.dart';
import 'url_epic.dart';

final appEpic = combineEpics<AppState>([
  trackEpics,
  artworkEpics,
  colorEpics,
  startupEpics,
  searchEpics,
  lyricsEpics,
  timerEpics,
  urlEpics,
]);
