import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/actions/player_actions.dart';
import 'package:flyrics/actions/timer_actions.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> stopCheckIsRunningTimerEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchTrackStartAction)
        .map((action) => SetCheckIsRunningTimerAction(false));

Stream<dynamic> onStartupStartCheckIsRunningTimerEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is SetArtworkColorsAction)
        .map((action) => SetCheckIsRunningTimerAction(true));

Stream<dynamic> restartCheckIsRunningTimerEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is SetIsRunningAction)
        .where((action) => !action.isRunning)
        .map((action) => SetCheckIsRunningTimerAction(true));

Stream<dynamic> stopRefreshingTrackTimerEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchTrackStartAction)
        .map((action) => SetRefreshTrackTimerAction(false));

Stream<dynamic> startRefreshingTrackTimerEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchTrackSuccessAction)
        .map((action) => SetRefreshTrackTimerAction(true));

final timerEpics = combineEpics<AppState>([
  stopCheckIsRunningTimerEpic,
  restartCheckIsRunningTimerEpic,
  onStartupStartCheckIsRunningTimerEpic,
  stopRefreshingTrackTimerEpic,
  startRefreshingTrackTimerEpic,
]);
