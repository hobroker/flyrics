import 'package:flyrics/actions/is_running_actions.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:flyrics/models/app_state.dart';

Stream<dynamic> checkIsRunningEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions.where((action) => action is CheckIsRunningStartAction).asyncMap(
        (action) => Spotify.isRunning()
            .then((value) => CheckIsRunningSuccessAction(value)));
