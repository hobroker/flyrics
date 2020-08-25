import 'package:stream_transform/stream_transform.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/actions/track_actions.dart';

Stream<dynamic> refreshCurrentTrackEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchTrackSuccessAction)
        .debounce(Duration(milliseconds: 1500))
        .map((action) => FetchTrackStartAction());
