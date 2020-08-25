import 'package:flyrics/models/track_model.dart';

class FetchTrackStartAction {}

class CheckTrackAction {}

class FetchTrackSuccessAction {
  final TrackModel track;

  FetchTrackSuccessAction(this.track);
}

class ResetActiveIdAction {}
