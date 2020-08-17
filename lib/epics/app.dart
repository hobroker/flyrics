import 'package:redux_epics/redux_epics.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/actions/is_running_actions.dart';
import 'package:flyrics/actions/track_actions.dart';

Stream<dynamic> fetchTrackOnStartEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions
      .where((action) => action is AppStartedAction)
      .map((event) => FetchTrackStartAction());
}

Stream<dynamic> checkIsRunningOnStartEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions
      .where((action) => action is AppStartedAction)
      .map((event) => CheckIsRunningStartAction());
}
