import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/actions/player_actions.dart';
import 'package:flyrics/actions/refresh_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/player.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:stream_transform/stream_transform.dart';

Stream startCheckIsRunningEpic(Stream actions, store) => actions
    .where((action) => action is AppStartedAction)
    .map((action) => RefreshCheckIsRunningTimerAction());

Stream trigerCheckIsRunningEpic(Stream actions, store) => actions
    .where((action) => action is RefreshCheckIsRunningTimerAction)
    .map((action) => RefreshCheckIsRunningAction());

Stream retrigerCheckIsRunningEpic(Stream actions, store) => actions
    .where((action) => action is RefreshCheckIsRunningAction)
    .debounce(Duration(milliseconds: 1500))
    .map((action) => RefreshCheckIsRunningTimerAction());

Stream refershCheckIsRunningEpic(Stream actions, store) => actions
    .where((action) => action is RefreshCheckIsRunningAction)
    .asyncMap((action) => api.spotify.isRunning())
    .where((isRunning) => isRunning != isPlayerRunning(store.state))
    .map((isRunning) => SetIsRunningAction(isRunning));

final playerEpics = combineEpics<AppState>([
  startCheckIsRunningEpic,
  trigerCheckIsRunningEpic,
  retrigerCheckIsRunningEpic,
  refershCheckIsRunningEpic,
]);
