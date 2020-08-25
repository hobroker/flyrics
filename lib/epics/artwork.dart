import 'package:flyrics/api/api.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> fetchArtworkImageAsBytesEpic(Stream<dynamic> actions, store) =>
    actions
        .where((action) => action is FetchTrackSuccessAction)
        .map((action) => action.track.artwork)
        .where((url) => url != null)
        .asyncMap((url) => api.util.getBytes(url).then((response) {
              return FetchArtworkBytesSuccessAction(response);
            }));

final artworkEpics = combineEpics<AppState>([
  fetchArtworkImageAsBytesEpic,
]);
