import 'package:flyrics/actions/app_actions.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/actions/track_actions.dart';

Stream<dynamic> startRefreshingOnStartEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is AppStartedAction)
        .map((event) => RefreshTrackAction());

Stream<dynamic> onRefreshCurrentTrackEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is RefreshTrackAction)
        .debounce(Duration(milliseconds: 1500))
        .map((action) => RefreshTrackAction());

Stream<dynamic> refreshCurrentTrackEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions.where((action) => action is RefreshTrackAction)
        .map((action) => FetchTrackStartAction());
