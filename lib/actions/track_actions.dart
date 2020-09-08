import 'package:flyrics/models/track_model.dart';
import 'package:flyrics/modules/store/action.dart';

class FetchTrackStartAction with ReduxAction {}

class CheckTrackAction with ReduxAction {}

class FetchTrackSuccessAction with ReduxAction {
  final TrackModel track;
  final String lastActiveId;

  FetchTrackSuccessAction(this.track, {this.lastActiveId});

  @override
  List get args => [track, lastActiveId];
}

class ResetActiveIdAction with ReduxAction {}
