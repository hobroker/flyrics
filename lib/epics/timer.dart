import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/actions/is_running_actions.dart';
import 'package:flyrics/actions/timer_actions.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> stopRefreshTrackTimerEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchTrackStartAction)
        .map((action) => StopRefreshTimerAction());

Stream<dynamic> onStartUpStartRefreshTrackTimerEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is SetArtworkColorsAction)
        .map((action) => StartRefreshTimerAction());

Stream<dynamic> restartUpStartRefreshTrackTimerEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is SetIsRunningAction)
        .where((action) => !action.isRunning)
        .map((action) => StartRefreshTimerAction());

final timerEpics = combineEpics<AppState>([
  stopRefreshTrackTimerEpic,
  restartUpStartRefreshTrackTimerEpic,
  onStartUpStartRefreshTrackTimerEpic,
]);
