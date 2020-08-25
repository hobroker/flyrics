import 'package:flyrics/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

import 'app.dart';
import 'track.dart';
import 'is_running.dart';
import 'refresh.dart';

final epic = combineEpics<AppState>([
  fetchTrackOnStartEpic,
//  refreshCurrentTrackEpic,
//  onRefreshCurrentTrackEpic,
//  startRefreshingOnStartEpic,
  checkIsRunningOnStartEpic,
  fetchCurrentTrackEpic,
  fetchArtworkImageAsBytesEpic,
  findArtworkColorsEpic,
  checkIsRunningEpic,
]);
