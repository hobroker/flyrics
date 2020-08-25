import 'package:flyrics/api/api.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> triggerFetchArtworkImageAsBytesEpic(
        Stream<dynamic> actions, store) =>
    actions
        .where((action) => action is FetchTrackSuccessAction)
        .map((action) => action.track.artwork)
        .where((url) => url != null)
        .map((url) => FetchArtworkBytesStartAction(url));

Stream<dynamic> setArtworkAsMissingEpic(Stream<dynamic> actions, store) =>
    actions
        .where((action) => action is FetchTrackSuccessAction)
        .map((action) => action.track.artwork)
        .where((url) => url == null)
        .map((url) => SetArtworkAsMissingAction());

Stream<dynamic> fetchArtworkImageAsBytesEpic(Stream<dynamic> actions, store) =>
    actions
        .where((action) => action is FetchArtworkBytesStartAction)
        .map((action) => getTrackArtwork(store.state))
        .asyncMap((url) => api.spotify.getImageBytes(url))
        .map((response) => FetchArtworkBytesSuccessAction(response));

final artworkEpics = combineEpics<AppState>([
  triggerFetchArtworkImageAsBytesEpic,
  fetchArtworkImageAsBytesEpic,
  setArtworkAsMissingEpic,
]);
