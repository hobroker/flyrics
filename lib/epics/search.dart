import 'package:redux_epics/redux_epics.dart';
import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/actions/lyrics_actions.dart';
import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/selectors/search.dart';
import 'package:flyrics/models/app_state.dart';

Stream<dynamic> searchLyricsOnAppStartEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is AppStartedAction)
        .map((action) => SearchLyricsStartAction());

Stream<dynamic> searchLyricsEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is SearchLyricsStartAction)
        .map((action) => getSearchQuery(store.state))
        .asyncMap((query) => api.genius
            .search(query)
            .then((results) => SearchLyricsSuccessAction(results)));

Stream<dynamic> onSearchSuccessEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is SearchLyricsSuccessAction)
        .map((action) => getSearchQuery(store.state))
        .map((query) => FetchLyricsStartAction(query));

Stream<dynamic> fetchLyricsEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchLyricsStartAction)
        .map((action) => action.query)
        .asyncMap((query) => api.genius
            .fetchLyrics(query)
            .then((text) => FetchLyricsSuccessAction(text)));
