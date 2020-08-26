import 'package:flyrics/models/track_model.dart';
import 'package:flyrics/store/action.dart';

class FetchTrackStartAction with Action {}

class CheckTrackAction with Action {}

class FetchTrackSuccessAction with Action {
  final TrackModel track;

  FetchTrackSuccessAction(this.track);

  @override
  String toString() => '${runtimeType}($track)';
}

class ResetActiveIdAction with Action {}

class RefreshCurrentTrackTimerAction with Action {
  @override
  String toString() => null;
}

class RefreshCurrentTrackAction with Action {
  @override
  String toString() => null;
}
