import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:redux_epics/redux_epics.dart';

Stream triggerFetchArtworkImageAsBytesEpic(Stream actions, store) => actions
        .where((action) => action is FetchTrackSuccessAction)
        .map((action) => action.track.artwork)
        .where((url) => url != null)
        .map((url) {
      var id = getActiveTrackId(store.state);
      return FetchArtworkBytesStartAction(
        url,
        id: id,
      );
    });

Stream setArtworkAsMissingEpic(Stream actions, store) => actions
    .where((action) => action is FetchTrackSuccessAction)
    .map((action) => action.track.artwork)
    .where((url) => url == null)
    .map((url) => SetArtworkAsMissingAction());

Stream fetchArtworkImageAsBytesEpic(Stream actions, store) => actions
        .where((action) => action is FetchArtworkBytesStartAction)
        .map((action) => getTrackArtwork(store.state))
        .asyncMap((url) => api.spotify.getImageBytes(url))
        .map((response) {
      var id = getActiveTrackId(store.state);
      return FetchArtworkBytesSuccessAction(
        response,
        id: id,
      );
    });

final artworkEpics = combineEpics<AppState>([
  triggerFetchArtworkImageAsBytesEpic,
  fetchArtworkImageAsBytesEpic,
  setArtworkAsMissingEpic,
]);
