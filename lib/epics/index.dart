import 'package:flyrics/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

import 'app.dart';
import 'search.dart';
import 'track.dart';
import 'is_running.dart';

final epic = combineEpics<AppState>([
  fetchTrackOnStartEpic,
  checkIsRunningOnStartEpic,
  fetchCurrentTrackEpic,
  fetchArtworkImageAsBytesEpic,
  findArtworkColorsEpic,
  checkIsRunningEpic,
  searchLyricsOnAppStartEpic,
  searchLyricsEpic,
]);
