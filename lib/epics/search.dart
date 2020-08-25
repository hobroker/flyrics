import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/search.dart';
import 'package:redux_epics/redux_epics.dart';

Stream searchLyricsOnTrachFetchSuccessEpic(Stream actions, store) => actions
    .where((action) => action is FetchTrackSuccessAction)
    .map((action) => SearchStartAction());

Stream searchLyricsEpic(Stream actions, store) => actions
    .where((action) => action is SearchStartAction)
    .map((action) => getSearchQuery(store.state))
    .asyncMap((query) => api.genius.search(query))
    .map((results) => SearchSuccessAction(results));

final searchEpics = combineEpics<AppState>([
  searchLyricsOnTrachFetchSuccessEpic,
  searchLyricsEpic,
]);
