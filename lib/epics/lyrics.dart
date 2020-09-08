import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/selectors/lyrics.dart';
import 'package:flyrics/selectors/search.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:redux_epics/redux_epics.dart';

Stream onSearchStartEpic(Stream actions, store) => actions
    .where((action) => action is SearchStartAction)
    .where((action) => !activeTrackHasLyrics(store.state))
    .map((action) => SetLyricsLoadingAction());

Stream onSearchSuccessEpic(Stream actions, store) => actions
        .where((action) => action is SearchSuccessAction)
        .map((action) => getFirstSearchResultUrl(store.state))
        .map((url) {
      var id = getActiveTrackId(store.state);
      return FetchLyricsStartAction(url, id: id);
    });

Stream fetchLyricsEpic(Stream actions, store) => actions
        .where((action) => action is FetchLyricsStartAction)
        .map((action) => action.url)
        .asyncMap((url) => I<Api>().genius.fetchLyrics(url))
        .map((result) {
      var id = getActiveTrackId(store.state);
      return FetchLyricsSuccessAction(result, id: id);
    });

final lyricsEpics = combineEpics<AppState>([
  onSearchSuccessEpic,
  fetchLyricsEpic,
]);
