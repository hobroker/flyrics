import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:flyrics/actions/track_actions.dart';

Stream<dynamic> triggerRefreshEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) =>
            action is CheckTrackAction || action is AppStartedAction)
        .debounce(Duration(milliseconds: 1500))
        .map((action) => CheckTrackAction());

Stream<dynamic> retriggerRefreshEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is CheckTrackAction)
        .map((action) => FetchTrackStartAction());

Stream<dynamic> refreshCurrentTrackEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is CheckTrackAction)
        .map((action) => FetchTrackStartAction());

final refreshEpics = combineEpics<AppState>([
  triggerRefreshEpic,
  retriggerRefreshEpic,
  refreshCurrentTrackEpic,
]);
