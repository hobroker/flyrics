import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/actions/search_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/selectors/lyrics.dart';
import 'package:redux_epics/redux_epics.dart';
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
        .asyncMap((query) => api.genius.search(query).then((results) {
              return SearchLyricsSuccessAction(results);
            }));
