import 'dart:async';

import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/selectors/app.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:redux/redux.dart';

void trackRefresh(Store store, {Duration every}) {
  Timer.periodic(every, (Timer timer) async {
    var isRunning = isSpotifyRunning(store.state);
    if (!isRunning) {
      // start another timer to check if the player started
      return;
    }

    var currentTrack = getTrack(store.state);
    var newTrack = await api.spotify.fetchCurrentTrack();

    if (newTrack != currentTrack) {
      store.dispatch(FetchTrackSuccessAction(newTrack));
    }
  });
}
