import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/actions/player_actions.dart';
import 'package:flyrics/actions/timer_actions.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/timer.dart';
import 'package:redux_epics/redux_epics.dart';

Stream stopCheckIsRunningTimerEpic(Stream actions, store) => actions
    .where((action) => action is FetchTrackStartAction)
    .map((action) => SetCheckIsRunningTimerAction(false));

Stream onStartupStartCheckIsRunningTimerEpic(Stream actions, store) => actions
    .where((action) => action is SetArtworkColorsAction)
    .where((action) => !isCheckIsRunningTimerActive(store.state))
    .map((action) => SetCheckIsRunningTimerAction(true));

Stream restartCheckIsRunningTimerEpic(Stream actions, store) => actions
    .where((action) => action is SetIsRunningAction)
    .where((action) => !action.isRunning)
    .map((action) => SetCheckIsRunningTimerAction(true));

Stream stopRefreshingTrackTimerEpic(Stream actions, store) => actions
    .where((action) => action is FetchTrackStartAction)
    .where((action) => isCheckIsRunningTimerActive(store.state))
    .map((action) => SetRefreshTrackTimerAction(false));

Stream startRefreshingTrackTimerEpic(Stream actions, store) => actions
    .where((action) => action is FetchTrackSuccessAction)
    .where((action) => !isCheckIsRunningTimerActive(store.state))
    .map((action) => SetRefreshTrackTimerAction(true));

final timerEpics = combineEpics<AppState>([
  stopCheckIsRunningTimerEpic,
  restartCheckIsRunningTimerEpic,
  onStartupStartCheckIsRunningTimerEpic,
  stopRefreshingTrackTimerEpic,
  startRefreshingTrackTimerEpic,
]);
