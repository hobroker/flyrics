import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/actions/player_actions.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> fetchTrackOnStartEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is SetIsRunningAction)
        .where((action) => action.isRunning)
        .map((isRunning) => FetchTrackStartAction());

Stream<dynamic> checkIsRunningOnStartEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is AppStartedAction)
        .map((event) => CheckIsRunningStartAction());

Stream<dynamic> checkIsRunningEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is CheckIsRunningStartAction)
        .asyncMap((action) => api.spotify.isRunning())
        .map((value) => SetIsRunningAction(value));

final startupEpics = combineEpics<AppState>([
  fetchTrackOnStartEpic,
  checkIsRunningOnStartEpic,
  checkIsRunningEpic,
]);
