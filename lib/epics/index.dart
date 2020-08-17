import 'package:flyrics/epics/is_running.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

import 'app.dart';
import 'track.dart';

final epic = combineEpics<AppState>([
  fetchTrackOnStartEpic,
  checkIsRunningOnStartEpic,

  fetchCurrentTrackEpic,
  checkIsRunningEpic,
]);
