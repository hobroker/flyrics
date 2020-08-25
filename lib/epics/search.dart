import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/selectors/search.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> searchLyricsOnAppStartEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is AppStartedAction)
        .map((action) => SearchStartAction());

Stream<dynamic> searchLyricsEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is SearchStartAction)
        .map((action) => getSearchQuery(store.state))
        .asyncMap((query) => api.genius
            .search(query)
            .then((results) => SearchSuccessAction(results)));

Stream<dynamic> onSearchSuccessEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is SearchSuccessAction)
        .map((action) => getFirstSearchResultUrl(store.state))
        .map((url) => FetchLyricsStartAction(url));

Stream<dynamic> fetchLyricsEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchLyricsStartAction)
        .map((action) => action.url)
        .asyncMap((url) => api.genius
            .fetchLyrics(url)
            .then((text) => FetchLyricsSuccessAction(text)));

final searchEpics = combineEpics<AppState>([
  searchLyricsOnAppStartEpic,
  searchLyricsEpic,
  onSearchSuccessEpic,
  fetchLyricsEpic,
]);
