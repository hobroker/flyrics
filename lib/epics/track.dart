import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> fetchCurrentTrackEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchTrackStartAction)
        .asyncMap((action) => api.spotify.fetchCurrentTrack())
        .where((track) => track != getActiveTrack(store.state))
        .map((track) => FetchTrackSuccessAction(track));

final trackEpics = combineEpics<AppState>([
  fetchCurrentTrackEpic,
]);
