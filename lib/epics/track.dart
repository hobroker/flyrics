import 'package:flyrics/api/spotify.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/actions/track_actions.dart';

Stream<dynamic> fetchCurrentTrackEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions.where((action) => action is FetchTrackStartAction).asyncMap(
          (action) => Spotify.fetchCurrentTrack()
          .then((track) => FetchTrackSuccessAction(track)));
}
