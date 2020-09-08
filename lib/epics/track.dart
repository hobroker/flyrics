import 'package:flyrics/actions/player_actions.dart';
import 'package:flyrics/actions/refresh_actions.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/selectors/player.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:stream_transform/stream_transform.dart';

Stream fetchCurrentTrackEpic(Stream actions, store) => actions
    .where((action) => action is FetchTrackStartAction)
    .asyncMap((action) => I<Api>().spotify.fetchCurrentTrack())
    .where((track) => track != getActiveTrack(store.state))
    .map((track) => track == null
        ? SetIsRunningAction(false)
        : FetchTrackSuccessAction(
            track,
            lastActiveId: getActiveTrackId(store.state),
          ));

Stream startRefershCurrentTrackEpic(Stream actions, store) => actions
    .where((action) => action is FetchTrackStartAction)
    .map((action) => RefreshCurrentTrackTimerAction());

Stream trigerRefershCurrentTrackEpic(Stream actions, store) => actions
    .where((action) => action is RefreshCurrentTrackTimerAction)
    .map((action) => RefreshCurrentTrackAction());

Stream retrigerRefershCurrentTrackEpic(Stream actions, store) => actions
    .where((action) => action is RefreshCurrentTrackAction)
    .debounce(Duration(milliseconds: 1500))
    .map((action) => RefreshCurrentTrackTimerAction());

Stream refershCurrentTrackEpic(Stream actions, store) => actions
    .where((action) => action is RefreshCurrentTrackAction)
    .debounce(Duration(milliseconds: 1500))
    .where((action) =>
        isPlayerRunning(store.state) && !isTrackLoading(store.state))
    .asyncMap((action) => I<Api>().spotify.fetchCurrentTrack())
    .where((track) => track != getActiveTrack(store.state))
    .map((track) => track == null
        ? SetIsRunningAction(false)
        : FetchTrackSuccessAction(
            track,
            lastActiveId: getActiveTrackId(store.state),
          ));

Stream resetActiveIdEpic(Stream actions, store) => actions
    .where((action) => action is SetIsRunningAction)
    .where((action) => !action.payload)
    .map((action) => ResetActiveIdAction());

final trackEpics = combineEpics<AppState>([
  fetchCurrentTrackEpic,
  resetActiveIdEpic,
  startRefershCurrentTrackEpic,
  trigerRefershCurrentTrackEpic,
  retrigerRefershCurrentTrackEpic,
  refershCurrentTrackEpic,
]);
