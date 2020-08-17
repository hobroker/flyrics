import 'package:flyrics/models/track.dart';

class FetchTrackStartAction {}

class FetchTrackSuccessAction {
  final Track track;

  FetchTrackSuccessAction(this.track);
}
