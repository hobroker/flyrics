import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:flyrics/actions/track_actions.dart';

Stream<dynamic> triggerRefreshEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is CheckTrackAction)
        .where((action) => action is AppStartedAction)
        .debounce(Duration(milliseconds: 1500))
        .map((action) => CheckTrackAction());

Stream<dynamic> refreshCurrentTrackEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is CheckTrackAction)
        .map((action) => FetchTrackStartAction());

final refreshEpics = combineEpics<AppState>([
  triggerRefreshEpic,
  refreshCurrentTrackEpic,
]);
