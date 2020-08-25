import 'package:flyrics/models/track.dart';

class FetchTrackStartAction {}

class CheckTrackAction {}

class FetchTrackSuccessAction {
  final Track track;

  FetchTrackSuccessAction(this.track);
}
