import 'package:redux_epics/redux_epics.dart';
import 'package:flyrics/models/app_state.dart';

import 'startup.dart';
import 'search.dart';
import 'track.dart';
import 'is_running.dart';

final appEpic = combineEpics<AppState>([
  fetchTrackOnStartEpic,
  checkIsRunningOnStartEpic,
  fetchCurrentTrackEpic,
  fetchArtworkImageAsBytesEpic,
  findArtworkColorsEpic,
  checkIsRunningEpic,
  searchLyricsOnAppStartEpic,
  searchLyricsEpic,
  onSearchSuccessEpic,
  fetchLyricsEpic,
]);
