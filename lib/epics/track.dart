import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> fetchCurrentTrackEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchTrackStartAction)
        .map((action) => getTrack(store.state))
        .asyncMap((currentTrack) {
      return api.spotify.fetchCurrentTrack().then((track) {
        if (currentTrack != track) {
          return FetchTrackSuccessAction(track);
        }
      });
    });

final trackEpics = combineEpics<AppState>([
  fetchCurrentTrackEpic,
]);
