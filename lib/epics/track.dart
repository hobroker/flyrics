import 'package:flyrics/actions/player_actions.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:redux_epics/redux_epics.dart';

Stream fetchCurrentTrackEpic(Stream actions, store) => actions
    .where((action) => action is FetchTrackStartAction)
    .asyncMap((action) => api.spotify.fetchCurrentTrack())
    .where((track) => track != getActiveTrack(store.state))
    .map((track) => FetchTrackSuccessAction(track));

Stream resetActiveIdEpic(Stream actions, store) => actions
    .where((action) => action is SetIsRunningAction)
    .where((action) => !action.isRunning)
    .map((action) => ResetActiveIdAction());

final trackEpics = combineEpics<AppState>([
  fetchCurrentTrackEpic,
  resetActiveIdEpic,
]);
