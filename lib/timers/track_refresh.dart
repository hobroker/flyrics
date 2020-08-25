import 'dart:async';

import 'package:flyrics/actions/is_running_actions.dart';
import 'package:flyrics/actions/track_actions.dart';
//import 'package:flyrics/api/api.dart';
//import 'package:flyrics/selectors/app.dart';
//import 'package:flyrics/selectors/track.dart';
import 'package:redux/redux.dart';

void trackRefresh(Store store, {Duration every}) {
//  Timer.periodic(every, (Timer timer) async {
//    var shouldRun = isRefreshTimerRunning(store.state);
//    if (!shouldRun) {
//      return;
//    }
//
//    var prevIsRunning = isSpotifyRunning(store.state);
//    var nextIsRunning = await api.spotify.isRunning();
//    if (nextIsRunning != prevIsRunning) {
//      store.dispatch(SetIsRunningAction(nextIsRunning));
//    }
//
//    if (!shouldRun || !nextIsRunning) {
//      return;
//    }
//
//    print('fetch');
//    var currentTrack = getTrack(store.state);
//    try {
//      var newTrack = await api.spotify.fetchCurrentTrack();
//
//      if (newTrack != currentTrack) {
//        store.dispatch(FetchTrackSuccessAction(newTrack));
//      }
//    } catch(e) {
//      print(e);
//    }
//  });
}
