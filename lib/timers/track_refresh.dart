import 'dart:async';

import 'package:flyrics/actions/player_actions.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/selectors/timer.dart';
import 'package:flyrics/selectors/player.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:redux/redux.dart';

void trackRefresh(Store store, {Duration every}) async {
  Timer.periodic(every, (Timer timer) async {
    var shouldRun = checkIsRunningTimerActive(store.state);
    if (!shouldRun) {
      return;
    }

    var prevIsRunning = isPlayerRunning(store.state);
    var nextIsRunning = await api.spotify.isRunning();
    if (nextIsRunning != prevIsRunning) {
      // TODO remove delay
      await Future.delayed(Duration(milliseconds: 500));
      store.dispatch(SetIsRunningAction(nextIsRunning));
    }
  });

  Timer.periodic(every, (Timer timer) async {
    var shouldRun = isRefreshTrackTimerActive(store.state);
    if (!shouldRun) {
      return;
    }

    var currentTrackId = getActiveTrackId(store.state);
    var newTrack = await api.spotify.fetchCurrentTrack();

    if (newTrack.id != currentTrackId) {
      store.dispatch(FetchTrackSuccessAction(newTrack));
    }
  });
}
