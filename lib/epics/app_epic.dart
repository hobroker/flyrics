import 'package:flyrics/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

import 'color.dart';
import 'startup.dart';
import 'search.dart';
import 'artwork.dart';
import 'refresh.dart';
import 'track.dart';

final appEpic = combineEpics<AppState>([
  trackEpics,
  artworkEpics,
  colorEpics,
  startupEpics,
  searchEpics,
  refreshEpics,
]);
